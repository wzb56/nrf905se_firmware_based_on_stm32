/******************** (C) COPYRIGHT 2011 sdu emlib ********************
**** 	filename: nrf905.c
***		description: This file provides  the fuctions implemented in NRF905SE.
***		author: wzb
***		date: 2011/5/13
*********************************************************************/

/***********************include files *******************************/
#include "nrf905.h"


/*********************** global variables ***************************/
u8 NRF905SE_RxBuffer[NRF905SE_BufferSize];
u8 NRF905SE_TxBuffer[NRF905SE_BufferSize] = {
	  0x30,0x32,0x33,0x41, 0x42,0x43,0x44,0x45,  0x30,0x32,0x33,0x41, 0x42,0x43,0x44,0x45,//16
	   0x30,0x32,0x33,0x41, 0x42,0x43,0x44,0x45,  0x30,0x32,0x33,0x41, 0x42,0x43,0x44,0x45//32												 //54
	};
u8 NRF905SE_TxAddress[NRF905SE_AddressSize] = {0x31, 0x32, 0x33, 0x34};
u8 NRF905SE_RxAddress[NRF905SE_AddressSize] = {0x30, 0x31, 0x32, 0x33};

u8 TxAddress[NRF905SE_AddressSize];
u8 RxAddress[NRF905SE_AddressSize];

u8 NRF905SE_DR_FLAG = 0;


/************************NRF905SE configer register type**********/
typedef struct __NRFConfig__ {
   u8 NRF905SE_Config_Length;  /* the bytes size of the configer */
   u8 NRF905SE_Config_Buf[10];
}NRF905SE_InitTypeDef;

u8 NRF905SE_Config_Buf[11] =
{
  10,                               //配置命令 数组的长度
  0x4c,                             //CH_NO,配置频段在430MHZ
  0x0c,                             //输出功率为10db,不重发，节电为正常模式
  0x44,                             //地址宽度设置，为4字节
  0x20,0x20,                        //接收发送有效数据长度为32字节
  0xCC,0xCC,0xCC,0xCC,              //接收地址
  0x58,                            //CRC充许，8位CRC校验，外部时钟信号不使能，16M晶振
};



/*---------------------- NRF905SE biscal read/write  functions ---------------*/
static void NRF905SE_GPIO_Config(void);
static void NRF905SE_NVIC_Config(void);
static void NRF905SE_EXTI_Config(void);
static void NRF905SE_InitWriteCR(void);


static void SPI_SendByte(SPI_TypeDef * SPIx, u8 data);
static u8 SPI_ReceiveByte(SPI_TypeDef * SPIx) ;

static u8 		NRF905SE_ReadReg_u8(u8 op);
static void 	NRF905SE_WriteReg_u8(u8 op, u8 value);

static u8 		NRF905SE_ReadWriteReg_u8(u8 op, u8 value);

static void 	NRF905SE_WriteReg_Byte(u8 op,  u8 value) ;
static u8		NRF905SE_ReadReg_Byte(u8 op);

static u8 * 	NRF905SE_ReadReg_Bytes(u8 op_r, u8* arrayPtr, u8 arraySize);
static void 	NRF905SE_WriteReg_Bytes(u8 op_w, const u8* arrayPtr, u8 arraySize);

static u8 * NRF905SE_GetTxRxAddress(u8 op_r, u8* addr_array, u8 addr_array_length);
static void NRF905SE_SetTxRxAddress(u8 op_w, const u8 * addr_array, u8 addr_array_length);

/*------------end of NRF905SE  biscal read/write  functions ------------------*/


/*******************************************
    函数功能：NRF905SE GPIO配置
    入口参数：无
    返回：    无
    备注：
            配置IRQ、CSN(SPI的NSS引脚)、CE引脚
            CSN引脚的模式为普通的输出，而不是复用
*********************************************/
static void NRF905SE_GPIO_Config(void)
{
  GPIO_InitTypeDef GPIO_InitStructure;

  /* clock  enable **/
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA | RCC_APB2Periph_GPIOC| RCC_APB2Periph_AFIO, ENABLE);

  /*  NRF905SE CE pin configuration PA.00 */
  GPIO_InitStructure.GPIO_Pin = NRF905SE_CE_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(GPIOA, &GPIO_InitStructure);

  /*  NRF905SE Tx_EN pin configuration  PA.03*/
  GPIO_InitStructure.GPIO_Pin = NRF905SE_TX_EN_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(GPIOA, &GPIO_InitStructure);

    /*  NRF905SE CSN pin configuration  PA.04 */
  GPIO_InitStructure.GPIO_Pin = NRF905SE_CSN_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(GPIOA, &GPIO_InitStructure);


  /* NRF905SE IRQ pin configeration PC.00 */
  GPIO_InitStructure.GPIO_Pin = NRF905SE_IRQ_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(GPIOC, &GPIO_InitStructure);

   /*  NRF905SE_AM_PIN pin configuration  PC.01*/
  GPIO_InitStructure.GPIO_Pin = NRF905SE_AM_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(GPIOC, &GPIO_InitStructure);


   /*  NRF905SE_CD_PIN pin configuration PC.02*/
  GPIO_InitStructure.GPIO_Pin = NRF905SE_CD_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(GPIOC, &GPIO_InitStructure);

 /*  NRF905SE_PWR_UP_PIN pin configuration PC.03 */
  GPIO_InitStructure.GPIO_Pin = NRF905SE_PWR_UP_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(GPIOC, &GPIO_InitStructure);




}

/**********************************************
    函数功能：NRF905SE NVIC配置
    入口参数：无
    返回：   无
    备注：
            配置中断线优先级
*********************************************/
static void NRF905SE_NVIC_Config(void)
{
  NVIC_InitTypeDef NVIC_InitStructure;

#ifdef  VECT_TAB_RAM
  /* Set the Vector Table base location at 0x20000000 */
  NVIC_SetVectorTable(NVIC_VectTab_RAM, 0x0);
#else  /* VECT_TAB_FLASH  */
  /* Set the Vector Table base location at 0x08000000 */
  NVIC_SetVectorTable(NVIC_VectTab_FLASH, 0x0);
#endif

  /* Configure one bit for preemption priority */
  NVIC_PriorityGroupConfig(NVIC_PriorityGroup_0);

  /* Enable the EXTI0 Interrupt */
  NVIC_InitStructure.NVIC_IRQChannel = EXTI0_IRQChannel;
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);
}

/****************************************************
    函数功能：NRF905SE 外部中断配置
    入口参数：无
    返回：    无
    备注：
            配置中断引脚线、中断模式、高/低使能
***************************************************/
static void NRF905SE_EXTI_Config(void)
{

  EXTI_InitTypeDef EXTI_InitStructure;
  GPIO_EXTILineConfig(GPIO_PortSourceGPIOC, GPIO_PinSource0);
  EXTI_InitStructure.EXTI_Line = EXTI_Line0;
  EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
  EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Rising;
  EXTI_InitStructure.EXTI_LineCmd = ENABLE;
  EXTI_Init(&EXTI_InitStructure);


}


/*****************************************************
function name: 			NRF905SE_InitWriteCR;
function description: initialize the configer regester of NRF905SE;

parameters: none;
return:  none;
author: wzb
time:	2011/5/13/pm

notes: the internal function provided for the fuction: void NRF905SE_Configuration(void);
***********************************************/
void NRF905SE_InitWriteCR(void) {
	NRF905SE_InitTypeDef *  NRF905SE_InitStructurePtr =
	                 		(NRF905SE_InitTypeDef *) NRF905SE_Config_Buf ;		
	NRF905SE_WriteReg_Bytes(NRF905SE_WC, NRF905SE_InitStructurePtr->NRF905SE_Config_Buf,
							NRF905SE_InitStructurePtr->NRF905SE_Config_Length);	
}


/******************************************************
function name: 			NRF905SE_Configuraton;
function description: initialization  of NRF905SE;

parameters: none;
return:  none;
author: wzb
time:	2011/5/13/pm

notes: none
***********************************************/
void NRF905SE_Configuration(void) {
	
	NRF905SE_GPIO_Config();	
	NRF905SE_NVIC_Config();
	NRF905SE_EXTI_Config();	
	NRF905SE_InitWriteCR();	// initialize the Configer register of NRF905SE



    /********设置接收地址和发送地址*****/
    NRF905SE_SetRxAddress(NRF905SE_RxAddress, NRF905SE_AddressSize);
    NRF905SE_SetTxAddress(NRF905SE_TxAddress, NRF905SE_AddressSize);	

    NRF905SE_POWER_ON();        	
    NRF905SE_STANDBY();
}
	




/*********** set the mode spi/tx/rx ******************************************/

/*******************************************************************************
* Function Name  : NRF905SE_SetSPIMode
* Description    : set NRF905SE into SPI mode : means
*				   NRF90RSE Enter to standby mode:	
*                  standby mode enable : NRF905SE_TRX_CE = 0.
*
* Input          : None.
* Output         : None.
* Return         : None.
* Note			 : the change of mode  needs some interval time (>=650us).
*******************************************************************************/
void NRF905SE_SetSPIMode(void) {
    NRF905SE_POWER_ON();
	NRF905SE_STANDBY();
}


/*******************************************************************************
* Function Name  : NRF905SE_SetTxMode
* Description    : set NRF905SE into Tx mode :
*					Tx enanble				:	NRF905SE_TX_EN = 1;
*                  	ShockBurst Mode enable	:	NRF905SE_TRX_CE = 1.
*				
* Input          : None.
* Output         : None.
* Return         : None.
* Note			 : the change of mode  needs some interval time (>=650us).
*******************************************************************************/
void NRF905SE_SetTxMode(void)
{
    NRF905SE_POWER_ON();
	NRF905SE_MODE_TX();	
	NRF905SE_SHOCKBURST_TRX();	
	//delay_10us(130);   /***CE_ON至少持续650us，650us后NRF905SE开始检测空中信息 此时延为转换时研无需额外时延**/
}



/*******************************************************************************
* Function Name  : NRF905SE_SetRxMode
* Description    : set NRF905SE into Rx mode :
*				  Rx enable    			:		NRF905SE_TX_EN = 0;
*                 ShockBurst Mode enable: 		NRF905SE_TRX_CE = 1.
*
* Input          : None.
* Output         : None.
* Return         : None.
* Note			 : the change of mode  needs some interval time (>=650us).
*******************************************************************************/
void NRF905SE_SetRxMode(void)
{
    NRF905SE_POWER_ON();
	NRF905SE_MODE_RX();	
	NRF905SE_SHOCKBURST_TRX();		
	//delay_10us(10);   /***CE_ON至少持续650us，650us后NRF905SE开始检测空中信息**/
}
/***********end of  set the mode spi/tx/rx ***********************************/




/*********************Private functions ******************************/

static void SPI_SendByte(SPI_TypeDef * SPIx, u8 data) {	
	SPI_I2S_SendData(SPIx, (u16)data);
	while(SPI_I2S_GetFlagStatus(SPIx, SPI_I2S_FLAG_TXE) == RESET);
}

static u8 SPI_ReceiveByte(SPI_TypeDef * SPIx) {
	while(SPI_I2S_GetFlagStatus(SPIx, SPI_I2S_FLAG_RXNE) == RESET);
	return (u8)SPI_I2S_ReceiveData(SPIx);

}




/*******************************************************************************
* Function Name  : NRF905SE_Read_u8
* Description    :  internal fuction,it opterates after spi starts.
*					
*
*				
* Input          : None.
* Output         : valuePtr: u8 * - the pointer of the read value
* Return         : return the read value.
* Note			 : it is an internal private function: scope only in this file (static).
*******************************************************************************/
static u8 NRF905SE_Read_u8(u8 * valuePtr) {	
	SPI_SendByte(SPI_USING, NOP);	
	*valuePtr = SPI_ReceiveByte(SPI_USING);	
	return *valuePtr;
}

/*******************************************************************************
* Function Name  : NRF905SE_Write_u8
* Description    :  internal fuction,it opterates after spi starts.
*					
*
*				
* Input          : None.
* Output         : valuePtr: u8 * - the pointer of the write value
* Return         : void.
* Note			 : it is an internal private function: scope only in this file (static)
*******************************************************************************/
static void NRF905SE_Write_u8(const u8 * valuePtr) {	
	SPI_SendByte(SPI_USING, *valuePtr);
	SPI_ReceiveByte(SPI_USING);	
}


/********************* end of Private functions ******************************/





/******** the basical fuctions *************************************************/

/*******************************************************************************
* Function Name  : NRF905SE_ReadReg_u8
* Description    : the function read  a byte from the register which is decided by op .
*					
*
*				
* Input          : op:- op_r -- to indicate which register to be opterated .
* Output         : none.
* Return         : return the read value of the specifical register.
* Note			 : none.
*******************************************************************************/
u8 NRF905SE_ReadReg_u8(u8 op) {
	
	u8 retval;	
	NRF905SE_SetSPIMode();
	NRF905SE_SPI_START();

	NRF905SE_Write_u8(&op);	
	NRF905SE_Read_u8(&retval);	
	
	NRF905SE_SPI_END();	
	
	return retval;
}

/*******************************************************************************
* Function Name  : NRF905SE_WriteReg_u8
* Description    :   the function writes  a byte to the register which is decided by op .
*					
*
*				
* Input          : op:- op_w -- to indicate which register to be opterated .
*				  value: u8 ---the byte will be written to the resigester.
* Output         : none.
* Return         : none.
* Note			 : none.
*******************************************************************************/
void NRF905SE_WriteReg_u8(u8 op, u8 value) {	
	NRF905SE_SetSPIMode();
	NRF905SE_SPI_START();
	
	NRF905SE_Write_u8(&op);
	NRF905SE_Write_u8(&value);
	
	NRF905SE_SPI_END();	
}




/*******************************************************************************
* Function Name  : NRF905SE_ReadWrite_u8
* Description    :  internal fuction,it opterates after spi starts.
*					
*
*				
* Input          : op: -op_r/op_w (read/write op code);
*				  when op is a op_r, value = NOP, otherwise, value is a write value.
* Output         :  none.
* Return         : return the read value when op_r , otherwise unvildate data.
* Note			 : expired.
*******************************************************************************/
u8 NRF905SE_ReadWriteReg_u8(u8 op, u8 value) {
	u8 retval;
	
	NRF905SE_SetSPIMode();
	NRF905SE_SPI_START();
	
	NRF905SE_Write_u8(&op);

	SPI_SendByte(SPI_USING, value);	
	retval=SPI_ReceiveByte(SPI_USING);
	
	NRF905SE_SPI_END();
	
	return retval;
}


/*****************************************************
function name: 			NRF905SE_WriteReg_Byte;
function description:  this fuction is  the same as NRF905SE_WriteReg_u8  as alias ;

parameters:  op: u8- operation code to indicate the register to operate;
			 value : 	the value will be written to the specifical regiseter.
return:  none;
author: wzb
time:	2011/5/13/pm

notes: reference to the fuction NRF905SE_WriteReg_u8 , also is its alias;
****************************************************/
static void NRF905SE_WriteReg_Byte(u8 op,  u8 value) {
	NRF905SE_WriteReg_u8(op, value);

}

/************************************************
function name: 			NRF905SE_ReadReg_Byte .
function description:  this fuction is  the same as NRF905SE_ReadReg_u8  as alias .

parameters:  op: u8- operation code to indicate the register to operate.			
return:  none.
author: wzb
time:	2011/5/13/pm

notes: reference to the fuction NRF905SE_ReadReg_u8 , also is its alias.

***************************************************/
static u8  NRF905SE_ReadReg_Byte(u8 op) {
	return NRF905SE_ReadReg_u8(op);	
}



/*******************************************************************************
* Function Name  : NRF905SE_ReadReg_Bytes
* Description    : this fuction can read the register multibyts once.
*					
*
*				
* Input          : op_r:-(read operation code);				
*				   arraySize: the number of bytes will be read.
* Output         : arrayPtr: the pointer of multibytes will be read.
* Return         : return the poiter of the mutibytes.
* Note			 : none.
*******************************************************************************/

u8 * NRF905SE_ReadReg_Bytes(u8 op_r, u8* arrayPtr, u8 arraySize) {
	u8 i;
	NRF905SE_SetSPIMode();
	NRF905SE_SPI_START();
	
	NRF905SE_Write_u8(&op_r);

	for(i=0; i<arraySize; i++) {
		NRF905SE_Read_u8(arrayPtr+i);
	}
	
	NRF905SE_SPI_END();
	
	return arrayPtr;
}

/*******************************************************************************
* Function Name  : NRF905SE_WriteReg_Bytes
* Description    : this fuction can Write the register multibyts once.
*					
*
*				
* Input          : op_w:-(Write operation code);	
*				   arrayPtr: the pointer of multibytes will be written.
*				   arraySize: the number of bytes will be witten.
* Output         : none.
* Return         : void.
* Note			 : none.
*******************************************************************************/
void NRF905SE_WriteReg_Bytes(u8 op_w, const u8* arrayPtr, u8 arraySize) {
	u8 i;
	NRF905SE_SetSPIMode();
	NRF905SE_SPI_START();
	
	NRF905SE_Write_u8(&op_w);

	for(i=0; i<arraySize; i++) {
		NRF905SE_Write_u8(arrayPtr+i);
	}

	NRF905SE_SPI_END();	
}

/*************************end of the basical fuctions ************************/





/************************* the extend fuctions of NRF905SE *******************/

/*******************************************************************************
* Function Name  : NRF905SE_IsCRCModeEnable
* Description    : this fuction can get CRC Mode state: enable /disable.
*					
*
*				
* Input          : none.
*				
*				
* Output         : none.
* Return         : bool:- TRUE/FALSE
* Note			 : none.
*******************************************************************************/
bool NRF905SE_IsCRCModeEnable(void) {
	u8 op, mode;
	op = NRF905SE_RCRC;
	mode = NRF905SE_ReadReg_u8(op);
	mode &= 0x40;	
	return  mode ? TRUE : FALSE ;
}

/*******************************************************************************
* Function Name  : NRF905SE_GetCRCMode
* Description    : this fuction can get the mode of CRC : CRCMode_8bit/CRCMode_16bits.
*					
*
*				
* Input          : none.
*				
*				
* Output         : none.
* Return         : the mode of CRC: CRCMode_8bit/CRCMode_16bits.
* Note			 : none.
*******************************************************************************/
u8 NRF905SE_GetCRCMode(void) {
	u8 op, mode;
	op = NRF905SE_RCRC;
	mode = NRF905SE_ReadReg_u8(op);
	mode &= 0x80;
	
	return  mode  >> 7;
}


/*******************************************************************************
* Function Name  : NRF905SE_SetCRCMode
* Description    : this fuction can Set the mode of  CRC.
*					
*
*				
* Input          : CRC_mode : CRCMode --CRCMode_8bits /CRCMode_16bits.
*				
*				
* Output         : none.
* Return         : none.
* Note			 : none.
*******************************************************************************/
void NRF905SE_SetCRCMode(CRCMode CRC_mode) {
	u8 op, mode;
	op = NRF905SE_RCRC;
	
	mode =NRF905SE_ReadReg_u8(op);			
	mode &= 0x7F;
	mode |=  CRC_mode ? 0x80 : 0x00;
	
	op = NRF905SE_WCRC;
	NRF905SE_WriteReg_u8(op, mode);	
	
}



/*******************************************************************************
* Function Name  : NRF905SE_IsAutoRetranEnable
* Description    : this fuction can get the mode of  auto_retransmit.
*					
*
*				
* Input          : none.
*				
*				
* Output         : none.
* Return         : bool:- TRUE/FALSE
* Note			 : none.
*******************************************************************************/
bool NRF905SE_IsAutoRetranEnable(void) {
	u8 op, mode;
	op = NRF905SE_RAR;
	mode = NRF905SE_ReadReg_u8(op);
	mode &= 0x20;	
	return  mode ? TRUE : FALSE ;
}

/*******************************************************************************
* Function Name  : NRF905SE_GetAutoRetranMode
* Description    : this fuction can get the mode of  auto_retransmit.
*					
*
*				
* Input          : none.
*				
*				
* Output         : none.
* Return         : the mode of auto_retransmit.
* Note			 : none.
*******************************************************************************/
bool NRF905SE_GetAutoRetranMode(void) {
	u8 op, mode;
	op = NRF905SE_RAR;
	mode = NRF905SE_ReadReg_u8(op);
	mode &= 0x20;
	
	return  mode ? TRUE : FALSE ;
}


/*******************************************************************************
* Function Name  : NRF905SE_SetAutoRetran_Mode
* Description    : this fuction can Set the mode of  auto_retransmit.
*					
*
*				
* Input          : auto_retran_en : bool --TRUE/FALSE.
*				
*				
* Output         : none.
* Return         : none.
* Note			 : none.
*******************************************************************************/
void NRF905SE_SetAutoRetranMode(bool auto_retran_en) {
	u8 op, mode;
	op = NRF905SE_WAR;
	
	mode =NRF905SE_ReadReg_u8(NRF905SE_RAR);			
	mode &= 0xDF;
	mode |=  auto_retran_en ? 0x20 : 0x00;
	NRF905SE_WriteReg_u8(op, mode);	
	
	
}

/*******************************************************************************
* Function Name  : NRF905SE_GetRxAddressSize
* Description    : this fuction can get the size of RxAddress in configer register.
*					
*
*				
* Input          : none.
*				
*				
* Output         : none.
* Return         : the size of RxAddress.
* Note			 : none.
*******************************************************************************/
u8 NRF905SE_GetRxAddressSize(void) {
	u8 op, size;
	op = NRF905SE_RTRX_AFW;
	size = NRF905SE_ReadReg_u8(op);
	size &= 0x07;
	return size;	
}

/*******************************************************************************
* Function Name  : NRF905SE_SetRxAddressSize
* Description    : this fuction can set the size of RxAddress in configer register.
*					
*
*				
* Input          : size : u8 --- available values: 1-4 .
*				
*				
* Output         : none.
* Return         : the size of RxAddress.
* Note			 : none.
*******************************************************************************/
void NRF905SE_SetRxAddressSize(u8 size) {	
	u8 op, i;
	op = NRF905SE_RTRX_AFW;
	//i = NRF905SE_GetRxAddressSize();
	i = NRF905SE_ReadReg_u8(op);
	i &= 0xF8;
	size &= 0x07;	
	size |= i;
	op = NRF905SE_WTRX_AFW;
	NRF905SE_WriteReg_u8(op, size);	
}


/*******************************************************************************
* Function Name  : NRF905SE_GetTxAddressSize
* Description    : this fuction can get the size of RxAddress in configer register.
*					
*
*				
* Input          : none.
*				
*				
* Output         : none.
* Return         : the size of TxAddress.
* Note			 : none.
*******************************************************************************/
u8 NRF905SE_GetTxAddressSize(void) {
	u8 op, size;
	op = NRF905SE_RTRX_AFW;
	size = NRF905SE_ReadReg_u8(op);
	size &= 0x70;
	
	return size >> 4;	
}


/*******************************************************************************
* Function Name  : NRF905SE_SetTxAddressSize
* Description    : this fuction can set the size of TxAddress in configer register.
*					
*
*				
* Input          : size: u8--- the size of Tx-Address register to be set, available values: 0-4 .
*				
*				
* Output         : none.
* Return         : the size of TxAddress.
* Note			 : none.
*******************************************************************************/
void NRF905SE_SetTxAddressSize(u8 size) {
	u8 op, i;
	op = NRF905SE_RTRX_AFW;
	//i = NRF905SE_GetTxAddressSize();
	i = NRF905SE_ReadReg_u8(op);
	i &= 0x8F;
	size &= 0x07;
	size = size << 4;
	size |= i;	
	op = NRF905SE_WTRX_AFW;
	NRF905SE_WriteReg_u8(op, size);	
}






/*******************************************************************************
* Function Name  : NRF905SE_GetRxPayloadSize
* Description    : this fuction can get the size of payload in Rx-Paylaod register.
*					
*
*				
* Input          : none.
*				
*				
* Output         : none.
* Return         : the size of payload in Rx-Payload.
* Note			 : none.
*******************************************************************************/
u8 NRF905SE_GetRxPayloadSize(void) {
	u8 op, size;
	op = NRF905SE_RRX_PW ;
	size = NRF905SE_ReadReg_u8(op);
	size &= 0x3f;	
	return size;	
}

/*******************************************************************************
* Function Name  : NRF905SE_SetRxPayloadSize
* Description    : this fuction can set the size of payload in Rx-Paylaod register.
*					
*
*				
* Input          : size: u8 --- the size of Rx-Payload register to be set; available values: 0-32.
*				
*				
* Output         : none
* Return         : the size of payload in Rx-Payload register.
* Note			 : none.
*******************************************************************************/
void NRF905SE_SetRxPayloadSize(u8 size) {
	u8 i, op;
	op = NRF905SE_RRX_PW ;
	i = NRF905SE_ReadReg_u8(op);
	i &= 0xc0;
	size &= 0x3f;
	size |= i;
	op = NRF905SE_WRX_PW ;
	NRF905SE_ReadWriteReg_u8(op, size);	
}


/*******************************************************************************
* Function Name  : NRF905SE_GetTxPayloadSize
* Description    : this fuction can get the size of payload in TxPaylaod register.
*					
*
*				
* Input          :none.
*				
*				
* Output         : none.
* Return         : the size of payload.
* Note			 : none.
*******************************************************************************/

u8 NRF905SE_GetTxPayloadSize(void) {
	u8 op, size;
	op = NRF905SE_RTX_PW ;
	size = NRF905SE_ReadReg_u8(op);
	size &= 0x3f;	
	return size;	
}

/*******************************************************************************
* Function Name  : NRF905SE_SetTxPayloadSize
* Description    : this fuction can set the size of payload in Tx-Paylaod register.
*					
*
*				
* Input          : size: u8 --- the size of Tx-Payload register to be set; available values: 0-32.
*				
*				
* Output         : none.
* Return         : the size of payload in Tx-Payload register.
* Note			 : none.
*******************************************************************************/
void NRF905SE_SetTxPayloadSize(u8 size) {
	u8 i, op;
	op = NRF905SE_RTX_PW ;
	i = NRF905SE_ReadReg_u8(op);
	i &= 0xc0;
	size &= 0x3f;
	size |= i;
	op = NRF905SE_WTX_PW ;
	NRF905SE_ReadWriteReg_u8(op, size);
}


/*****************************************************
function name: 			NRF905SE_Get_TxRxPayload 	;
function description: get Payload  in Tx-Payload/Rx-Payload register  of NRF905SE;

parameters:	 @1-- op_r: u8 --) indicate which register (tx-payload or rx-payload ) to be operated.
			 @2-- payload_array : u8 * : the array which will contain the payload .
		     @3-- payload_length :  u8 --- will be  indicated by tx-payload or rx-payload  size;
return:  u8 *;
author: wzb
time:	2011/5/13/pm

notes:  none;
***********************************************/
static u8 * NRF905SE_GetTxRxPayload(u8 op_r, u8 * payload_array, u8 payload_array_length)
{
    NRF905SE_ReadReg_Bytes(op_r, payload_array, payload_array_length);	
	return payload_array;	
}

/*****************************************************
function name: 			NRF905SE_SetTxRxPayload 	;
function description: Set Payload  in Tx-Payload/Rx-Payload register  of NRF905SE;

parameters:	 @1-- op_W: u8 --) indicate which register (Tx-payload or Rx-payload ) to be operated.
			 @2-- payload_array : u8 * : the array which will contain the payload .
		     @3-- payload_length :  u8 --- will be  indicated by tx-payload or rx-payload  size;
return:  none;
author: wzb
time:	2011/5/13/pm

notes:  none;
***********************************************/
static void NRF905SE_SetTxRxPayload(u8 op_w, const u8 * payload_array, u8 payload_array_length)
{
    NRF905SE_WriteReg_Bytes(op_w, payload_array, payload_array_length);		
}



/*****************************************************
function name: 			NRF905SE_GetTxPayload 	;
function description: get Payload  in Tx-Payload register  of NRF905SE;

parameters:
			 @1-- payload_array : u8 * : the array which will contain the payload .
		     @2-- payload_length :  u8 --- will be  indicated by tx-payload size;
return:  u8 *;
author: wzb
time:	2011/5/13/pm

notes:  none;
***********************************************/
u8 * NRF905SE_GetTxPayload(u8 * payload_array, u8 payload_array_length)
{
    NRF905SE_GetTxRxPayload(NRF905SE_RTP, payload_array, payload_array_length);
	
	return payload_array;	
}

/*****************************************************
function name: 			NRF905SE_SetTxPayload 	;
function description: set payload  in Tx-Payload register  of NRF905SE;

parameters:
			 @1-- addr_array : u8 * : the array which contains the payload.
		     @2-- payload_length :  u8 --- will be  indicated by Tx-payload size.
return:  u8 *;
author: wzb
time:	2011/5/13/pm

notes: none.
***********************************************/
void NRF905SE_SetTxPayload(const u8 * addr_array, u8 addr_array_length)
{
    NRF905SE_SetTxRxPayload(NRF905SE_WTP, addr_array, addr_array_length);	
}


/*****************************************************
function name: 			NRF905SE_GetRxPayload 	;
function description: get Payload  in Rx-Payload register  of NRF905SE;

parameters:
			 @1-- payload_array : u8 * : the array which will contain the payload .
		     @2-- payload_length :  u8 --- will be  indicated by tx-payload size;
return:  u8 *;
author: wzb
time:	2011/5/13/pm

notes:  none;
***********************************************/
u8 * NRF905SE_GetRxPayload(u8 * payload_array, u8 payload_array_length)
{
    NRF905SE_GetTxRxPayload(NRF905SE_RRP, payload_array, payload_array_length);
	
	return payload_array;	
}

/*****************************************************
function name: 			NRF905SE_Set_RxPayload 	;
function description: set payload  in Rx-Payload register  of NRF905SE;

parameters:
			 @1-- addr_array : u8 * : the array which contains the payload.
		     @2-- payload_length :  u8 --- will be  indicated by Rx-payload size.
return:  none;
author: wzb
time:	2011/5/13/pm

notes:  if the Rx-Payload register is read-only, this function will be dropped! But now the instruction NRF905SE_WRP NOT DEFINED!
***********************************************/
void NRF905SE_SetRxPayload(const u8 * addr_array, u8 addr_array_length)
{
    //NRF905SE_Set_TxRxPayload(NRF905SE_WRP=0x25, addr_array, addr_array_length);	
}


/************* the generous address register operation functions **************/

/*****************************************************
function name: 			NRF905SE_GetTxRxAddress 	;
function description: get Address  in tx-address/rx-address register  of NRF905SE;

parameters:  @1-- op_r : u8 * --- the operation code of tx-address or rx-address register.
			 @2-- addr_array : u8 * : the array which contains the address.
		     @3-- addr_array_length :  u8;
return:  u8 *;
author: wzb
time:	2011/5/13/pm

notes:  none;
***********************************************/
u8 * NRF905SE_GetTxRxAddress(u8 op_r, u8* addr_array, u8 addr_array_length)
{
    NRF905SE_ReadReg_Bytes(op_r, addr_array, addr_array_length);	
	
	return addr_array;
}


/*****************************************************
function name: 			NRF905SE_SetTxRxAddress 	;
function description: set Address  in tx-address/rx-addess register  of NRF905SE;

parameters:  @1-- op_w : u8 * --- the operation code of tx-address or rx-address register.
			 @2-- addr_array : u8 * : the array which contains the address.
		     @3-- addr_array_length :  u8;
return:  u8 *;
author: wzb
time:	2011/5/13/pm

notes:  none;
***********************************************/
void NRF905SE_SetTxRxAddress(u8 op_w, const u8 * addr_array, u8 addr_array_length)
{
    NRF905SE_WriteReg_Bytes(op_w, addr_array, addr_array_length);	
}



/*****************************************************
function name: 			NRF905SE_SetTxAddress 	;
function description: set Address  in tx-address register  of NRF905SE;

parameters:
			 @1-- addr_array : u8 * : the array which contains the address.
		     @2-- addr_array_length :  u8;
return:  u8 *;
author: wzb
time:	2011/5/13/pm

notes:  none;
***********************************************/
void NRF905SE_SetTxAddress( const u8 * addr_array, u8 addr_array_length)
{
    NRF905SE_SetTxRxAddress(NRF905SE_WTA, addr_array, addr_array_length);	
}


/*****************************************************
function name: 			NRF905SE_GetTxAddress 	;
function description: get Address  in tx-address register  of NRF905SE;

parameters:
			 @1-- addr_array : u8 * : the array which contains the address.
		     @2-- addr_array_length :  u8;
return:  u8 *;
author: wzb
time:	2011/5/13/pm

notes:  none;
***********************************************/
u8 * NRF905SE_GetTxAddress(u8 * addr_array, u8 addr_array_length)
{
    NRF905SE_GetTxRxAddress(NRF905SE_RTA, addr_array, addr_array_length);
	
	return addr_array;	
}

/*****************************************************
function name: 			NRF905SE_SetRxAddress 	;
function description: set Address  in Rx-address register  of NRF905SE;

parameters:
			 @1-- addr_array : u8 * : the array which contains the address.
		     @2-- addr_array_length :  u8;
return:  u8 *;
author: wzb
time:	2011/5/13/pm

notes:  none;
***********************************************/
void NRF905SE_SetRxAddress(const u8 * addr_array, u8 addr_array_length)
{
    NRF905SE_SetTxRxAddress(NRF905SE_WRA, addr_array, addr_array_length);	
}


/*****************************************************
function name: 			NRF905SE_GetRxAddress 	;
function description: get Address  in Rx-address register  of NRF905SE;

parameters:
			 @1-- addr_array : u8 * : the array which contains the address.
		     @2-- addr_array_length :  u8;
return:  u8 *;
author: wzb
time:	2011/5/13/pm

notes:  none;
***********************************************/
u8 * NRF905SE_GetRxAddress(u8 * addr_array, u8 addr_array_length)
{
    NRF905SE_GetTxRxAddress(NRF905SE_RRA, addr_array, addr_array_length);
	
	return addr_array;	
}


/*******************************************************************************
* Function Name  :  NRF905SE_SendData
* Description    : this functions descripts the process of NRF905SE send data.
*				
*
* Input          : None.
* Output         : None.
* Return         : None.
* Note			 : This function will block until data send process  finished,
*						implemented by the while recycle with the flag variable.
*******************************************************************************/
void NRF905SE_SendData(void) {
	// set the tx mode
	NRF905SE_SetTxMode();
	
	// wait for send finished
	while(!( NRF905SE_Is_Data_TxFinished())) ;
	
	// reset the flag
	NRF905SE_Reset_Data_TxFinished_Flag();
	
	//set NRF905SE to the standby  mode	
	NRF905SE_STANDBY();


}

/*******************************************************************************
* Function Name  :  NRF905SE_ReceiveData
* Description    : this functions descripts the process of NRF905SE receive data.
*				
*
* Input          : None.
* Output         : None.
* Return         : None.
* Note			 : This function will block until data receive process  finished,
*						implemented by the while recycle with the flag variable.
*******************************************************************************/
void NRF905SE_ReceiveData(void) {
	//set rx mode
	NRF905SE_SetRxMode();
	
	//wait for recieve finished
	while(! ( NRF905SE_Is_Data_RxFinished() ) );
	
	//reset the flag	
	NRF905SE_Reset_Data_RxFinished_Flag();
	
	//set NRF905SE to the standby  mode	
	NRF905SE_STANDBY();

}





/******************************packet send /receive **********/

/*******************************************************************************
* Function Name  :  NRF905SE_SendTxPacket
* Description    : this functions descripts the process of NRF905SE send  data, and you can set the payload
					and destination address through payload_array and tx_address_array;
*				
*
* Input          : payload_size: -- u8 ,.
				  tx_address_length -- u8;		
* Output         : payload_array:  set the data in the Tx_payload register;
				   tx_address_array --  the destination address to send 	

* Return         : None.
* Note			 : This function will block until data send process  finished,
*						implemented by the while recycle with the flag variable.
*******************************************************************************/
bool NRF905SE_SendTxPacket(const u8 * payload_array, u8 payload_size, const u8 * tx_address_array, u8 tx_address_length) {
	
	// prepare the data to be sent means set the payload to be sent
	NRF905SE_SetTxPayload(payload_array, payload_size);
	
	// set tx-address
	NRF905SE_SetTxAddress(tx_address_array, tx_address_length);
	
	// send data
	NRF905SE_SendData();
	
	return TRUE;

}

/*******************************************************************************
* Function Name  :  NRF905SE_SendTxPacket
* Description    : this functions descripts the process of NRF905SE receive data, and you can get the payload
						through payload_array to the default Tx_address;
*				
*
* Input          : payload_size: -- u8 ,.
				
* Output         : payload_array: set the data in the Tx_payload register;
				

* Return         : None.
* Note			 : This function will block until data send process  finished,
*						implemented by the while recycle with the flag variable.
*******************************************************************************/
bool NRF905SE_SendPacket(const u8 * payload_array, u8 payload_size) {
	
	// prepare the data to be sent means set the payload to be sent
	NRF905SE_SetTxPayload(payload_array, payload_size);
	
	// set tx-address default
	//NRF905SE_SetTxAddress(NRF905SE_TxAddress,NRF905SE_AddressSize);
	
	// send data
	NRF905SE_SendData();
	
	return TRUE;

}
/*******************************************************************************
* Function Name  :  NRF905SE_ReceivePacket
* Description    : this functions descripts the process of NRF905SE receive data, and you can get the payload
						through payload_array;
*				
*
* Input          : payload_size: -- u8 ,.
* Output         : payload_array: the data in the Rx_payload register;
* Return         : None.
* Note			 : This function will block until data receive process  finished,
*						implemented by the while recycle with the flag variable.
*******************************************************************************/
u8 *  NRF905SE_ReceivePacket(u8 * payload_array, u8 payload_size) {	
	// start receive data
	NRF905SE_ReceiveData();	
	
	// receive data finished
	NRF905SE_GetRxPayload(payload_array, payload_size);

	return payload_array;	

}


/*** interrupt process ****/

void NRF905SE_EXTI_DoIt() {
	
		NRF905SE_DR_FLAG = 1;
        EXTI_ClearITPendingBit(EXTI_Line0);


}







