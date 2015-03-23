/******************** (C) COPYRIGHT 2011 sdu emlib ********************
**** 	filename: nrf905.h
***		description: This file provides  the declarations in  NRF905SE.
***		author: wzb
***		date: 2011/5/13
*********************************************************************/
/**** prevent the recursive inclusion *********/
#ifndef __NRF905SE_H_
#define __NRF905SE_H_

/*** include files *****/
#include "stm32f10x_lib.h"

/***************射频芯片相关定义***************/

#define NRF905SE_BufferSize 	32
#define NRF905SE_AddressSize    4
#define NOP             0xFF						/*** SPI 全双工时的空操作 ***/
/*****************全局变量**********************/
extern u8 NRF905SE_TxBuffer[NRF905SE_BufferSize];      /*****发送数据所在数组***/
extern u8 NRF905SE_RxBuffer[NRF905SE_BufferSize];      /*****接收数据所在数组***/

extern u8 NRF905SE_TxAddress[NRF905SE_AddressSize];     /*****发送地址所在数组***/
extern u8 NRF905SE_RxAddress[NRF905SE_AddressSize];     /*****接收地址所在数组***/

extern u8 TxAddress[NRF905SE_AddressSize];
extern u8 RxAddress[NRF905SE_AddressSize];
extern u8 NRF905SE_DR_FLAG;                          /**数据发送完成或接受完成标志！**/



//------------define the SPI using-----------
#define SPI_USING                  SPI1


/****************NRF905SE引脚配置*************/

#define NRF905SE_CE_PIN  			GPIO_Pin_0      /*** A0 ***/
#define NRF905SE_TX_EN_PIN			GPIO_Pin_3		/*** A3 ***/

#define NRF905SE_CSN_PIN			GPIO_Pin_4		/*** A4 ***/ // SPI1 NSS

#define NRF905SE_DR_PIN				GPIO_Pin_0		/*** C0 ***/
#define NRF905SE_AM_PIN 			GPIO_Pin_1      /*** C1 ***/
#define NRF905SE_CD_PIN				GPIO_Pin_2		/*** C2 ***/
#define NRF905SE_PWR_UP_PIN			GPIO_Pin_3      /*** C3 ***/

#define NRF905SE_IRQ_PIN      		GPIO_Pin_0		/*** C0 ***/


/**** SPI SELECTED /DESELECTED ***/
#define NRF905SE_POWER_ON()             GPIOC->BSRR = NRF905SE_PWR_UP_PIN
#define NRF905SE_POWER_OFF()            GPIOC->BRR  = NRF905SE_PWR_UP_PIN

#define NRF905SE_CSN_ON() 	 		GPIOA->BSRR = NRF905SE_CSN_PIN    /*** SPI SELECTED CANCEL ***/
#define NRF905SE_CSN_OFF()   		GPIOA->BRR =  NRF905SE_CSN_PIN	   /*** SPI SELECTED  ***/
#define NRF905SE_SPI_START()		NRF905SE_CSN_OFF()
#define NRF905SE_SPI_END() 			NRF905SE_CSN_ON()

#define NRF905SE_CE_ON()     		GPIOA->BSRR = NRF905SE_CE_PIN
#define NRF905SE_CE_OFF()    		GPIOA->BRR =  NRF905SE_CE_PIN
#define NRF905SE_STANDBY()			NRF905SE_CE_OFF()
#define NRF905SE_SHOCKBURST_TRX()	NRF905SE_CE_ON()
#define NRF905SE_Standby()	 		NRF905SE_CE_OFF()
#define NRF905SE_ShockBurst_TRx()	NRF905SE_CE_ON()

#define NRF905SE_TX_EN_ON()       GPIOA->BSRR = NRF905SE_TX_EN_PIN
#define NRF905SE_TX_EN_OFF()      GPIOA->BRR =  NRF905SE_TX_EN_PIN
#define NRF905SE_MODE_TX()	 NRF905SE_TX_EN_ON()
#define NRF905SE_MODE_RX()	 NRF905SE_TX_EN_OFF()

/****************op of data ready  flag: dr indentify ****/

#define NRF905SE_Is_Data_RxFinished()      	        NRF905SE_DR_FLAG
#define NRF905SE_Is_Data_TxFinished()      			NRF905SE_DR_FLAG
#define NRF905SE_Reset_Data_RxFinished_Flag()      	NRF905SE_DR_FLAG = 0
#define NRF905SE_Reset_Data_TxFinished_Flag()   	NRF905SE_DR_FLAG = 0

//#define NRF905SE_IsDataReady()                      ( GPIOA->IDR & NRF905SE_DR_PIN)

/**************NRF905SE外部中断源配置************/
#define GPIO_PORT_SOURCE_IRQ_NRF905SE    GPIO_PortSourceGPIOA
#define GPIO_PIN_SOURCE_IRQ_NRF905SE     GPIO_PinSource3
#define EXTI_LINE_IRQ_NRF905SE           EXTI_Line3

typedef enum  {
		CRCMode_8bit = 0,
		CRCMode_16bit
} CRCMode;




/*********************NRF905SE SPI接口 控制指令 宏定义**************/
#define NRF905SE_WC 	0x00        // 设置配置寄存器 (write RF-Configeration Register)
#define NRF905SE_RC		0x10		// 读取配置寄存器 (read  RF-Configeration Register)

#define NRF905SE_WAR	0x01		//设置自动重传 AUTO_RETRAN 模式 (set:0x20\ restset:0x00)
#define NRF905SE_RAR	0x11		//读取自动重传 AUTO_RETRAN 模式 (set:0x20\ restset:0x00)

#define NRF905SE_WTRX_AFW 0x02		// 设置收发地址格式的宽度（字节个数）(Bit[7]:没用; TX_AFW[2:0] Bit[3]:没用; RX_AFW[2:0] 默认值 0100_0100 : 0x44)
#define NRF905SE_RTRX_AFW 0x12      // 读取收发地址格式的宽度（字节个数）(Bit[7]:没用; TX_AFW[2:0] Bit[3]:没用; RX_AFW[2:0] 默认值0100_0100 : 0x44 )

#define NRF905SE_WRX_PW 0x03		//设置接受数据的rx-payload寄存器的有效数据的宽度 (Bit[7:6]没用RX_PWR[5:0] 默认值 0010_0000 : 0x20)
#define NRF905SE_RRX_PW 0x13		//读取接受数据的rx-payload寄存器的有效数据的宽度 (Bit[7:6]没用RX_PWR[5:0] 默认值 0010_0000 : 0x20)

#define NRF905SE_WTX_PW 0x04		//设置接受数据的tx-payload寄存器的有效数据的宽度 (Bit[7:6]没用RX_PWR[5:0] 默认值 0010_0000 : 0x20)	
#define NRF905SE_RTX_PW 0x14		//读取接受数据的tx-payload寄存器的有效数据的宽度 (Bit[7:6]没用RX_PWR[5:0] 默认值 0010_0000 : 0x20)

#define NRF905SE_WRA	0x05		// 设置位于配置寄存器第5-8的4个字节的Rx-Address (write RX-Address)
#define NRF905SE_RRA	0x15		// 读取位于配置寄存器第5-8的4个字节的Rx-Address	(read Rx-Address)

#define NRF905SE_WCRC 	0x09 	// 设置CRC 校验的模式
#define NRF905SE_RCRC 	0x19 	// 读取CRC 校验的模式


#define NRF905SE_WTP	0x20		// 向TX-Payload 寄存器写入有效数据 (write the payload data to the Tx-payload register)
#define NRF905SE_RTP 	0x21		// 从Tx-payload 寄存器中读出有效数据 read the payload data in the Tx-payload register)

#define NRF905SE_WTA 	0x22		// 向Tx-Address 寄存器写入发送地址，即目标地址(write the destination address in the Tx-Address register)
#define NRF905SE_RTA	0x23		// 从Tx-Address	寄存器读取发送地址，(read the destination address from the Tx-Address register)

#define NRF905SE_RRP	0x24		// 从Tx-Payload 寄存器中读取接收到的有效数据(read the payload data from the Rx-Payload register)



/*------------ NRF905SE     functions ---------------------------------------*/



void NRF905SE_SetRxMode(void);
void NRF905SE_SetTxMode(void);

bool NRF905SE_RxPacket(void);
bool NRF905SE_TxPacket(void);



void NRF905SE_Configuration(void);
void NRF905SE_EXTI_DoIt(void);


/*****NRF905SE初始化，包括设置默认配置及发送、接收地址****/
void 	NRF905SE_Configuration(void);

/*---------------------------NRF905SE MODE setting functions------------------*/
void NRF905SE_SetSPIMode(void);
void NRF905SE_SetTxMode(void);
void NRF905SE_SetRxMode(void);
/*----------------endof NRF905SE MODE setting  functions----------------------*/


/*------------NRF905SE   functions -------------------------------------*/

bool 	NRF905SE_IsAutoRetranEnable(void);
bool	NRF905SE_GetAutoRetranMode(void);
void	NRF905SE_SetAutoRetranMode(bool auto_retran_en);

bool 	NRF905SE_IsCRCModeEnable(void);
u8 		NRF905SE_GetCRCMode(void);
void	NRF905SE_SetCRCMode(CRCMode CRC_mode);

u8 		NRF905SE_GetRxAddressSize(void);
void 	NRF905SE_SetRxAddressSize(u8 size) ;

u8 		NRF905SE_GetTxAddressSize(void);
void 	NRF905SE_SetTxAddressSize(u8 size);

u8 		NRF905SE_GetRxPayloadSize(void);
void 	NRF905SE_SetRxPayloadSize(u8 size);

u8 		NRF905SE_GetTxPayloadSize(void);
void 	NRF905SE_SetTxPayloadSize(u8 size);


u8 * 	NRF905SE_GetTxPayload(u8 * payload_array, u8 payload_array_length);
void 	NRF905SE_SetTxPayload(const u8 * addr_array, u8 addr_array_length);


u8 * 	NRF905SE_GetRxPayload(u8 * payload_array, u8 payload_array_length);
void 	NRF905SE_SetRxPayload(const u8 * addr_array, u8 addr_array_length);

void NRF905SE_SetTxAddress( const u8 * addr_array, u8 addr_array_length);
u8 * NRF905SE_GetTxAddress(u8 * addr_array, u8 addr_array_length);

void NRF905SE_SetRxAddress(const u8 * addr_array, u8 addr_array_length);
u8 * NRF905SE_GetRxAddress(u8 * addr_array, u8 addr_array_length);



void NRF905SE_SendData(void);
void NRF905SE_ReceiveData(void);

bool  NRF905SE_SendTxPacket(const u8 * payload_array, u8 payload_size, const u8 * tx_address_array, u8 tx_address_length);
bool  NRF905SE_SendPacket(const u8 * payload_array, u8 payload_size);
u8 *  NRF905SE_ReceivePacket(u8 * payload_array, u8 payload_size);

//外部中断处理函数
void  NRF905SE_EXTI_DoIt();








#endif  /** END OF DEFINE __NRF905SE_H_ ****/

