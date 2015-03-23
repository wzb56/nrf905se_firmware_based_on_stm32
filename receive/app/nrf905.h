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

/***************��ƵоƬ��ض���***************/

#define NRF905SE_BufferSize 	32
#define NRF905SE_AddressSize    4
#define NOP             0xFF						/*** SPI ȫ˫��ʱ�Ŀղ��� ***/
/*****************ȫ�ֱ���**********************/
extern u8 NRF905SE_TxBuffer[NRF905SE_BufferSize];      /*****����������������***/
extern u8 NRF905SE_RxBuffer[NRF905SE_BufferSize];      /*****����������������***/

extern u8 NRF905SE_TxAddress[NRF905SE_AddressSize];     /*****���͵�ַ��������***/
extern u8 NRF905SE_RxAddress[NRF905SE_AddressSize];     /*****���յ�ַ��������***/

extern u8 TxAddress[NRF905SE_AddressSize];
extern u8 RxAddress[NRF905SE_AddressSize];
extern u8 NRF905SE_DR_FLAG;                          /**���ݷ�����ɻ������ɱ�־��**/



//------------define the SPI using-----------
#define SPI_USING                  SPI1


/****************NRF905SE��������*************/

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

/****************op of data ready  flag: dr identify ****/

#define NRF905SE_Is_Data_RxFinished()      	        NRF905SE_DR_FLAG
#define NRF905SE_Is_Data_TxFinished()      			NRF905SE_DR_FLAG
#define NRF905SE_Reset_Data_RxFinished_Flag()      	NRF905SE_DR_FLAG = 0
#define NRF905SE_Reset_Data_TxFinished_Flag()   	NRF905SE_DR_FLAG = 0

//#define NRF905SE_IsDataReady()                      ( GPIOA->IDR & NRF905SE_DR_PIN)

/**************NRF905SE�ⲿ�ж�Դ����************/
#define NRF905SE_GPIO_PORT_SOURCE_IRQ   GPIO_PortSourceGPIOC
#define NRF905SE_GPIO_PIN_SOURCE_IRQ    GPIO_PinSource0
#define NRF905SE_EXTI_LINE_IRQ           EXTI_Line0

typedef enum  {
		CRCMode_8bit = 0,
		CRCMode_16bit
} CRCMode;




/*********************NRF905SE SPI�ӿ� ����ָ�� �궨��**************/
#define NRF905SE_WC 	0x00        // �������üĴ��� (write RF-Configeration Register)
#define NRF905SE_RC		0x10		// ��ȡ���üĴ��� (read  RF-Configeration Register)

#define NRF905SE_WAR	0x01		//�����Զ��ش� AUTO_RETRAN ģʽ (set:0x20\ restset:0x00)
#define NRF905SE_RAR	0x11		//��ȡ�Զ��ش� AUTO_RETRAN ģʽ (set:0x20\ restset:0x00)

#define NRF905SE_WTRX_AFW 0x02		// �����շ���ַ��ʽ�Ŀ�ȣ��ֽڸ�����(Bit[7]:û��; TX_AFW[2:0] Bit[3]:û��; RX_AFW[2:0] Ĭ��ֵ 0100_0100 : 0x44)
#define NRF905SE_RTRX_AFW 0x12      // ��ȡ�շ���ַ��ʽ�Ŀ�ȣ��ֽڸ�����(Bit[7]:û��; TX_AFW[2:0] Bit[3]:û��; RX_AFW[2:0] Ĭ��ֵ0100_0100 : 0x44 )

#define NRF905SE_WRX_PW 0x03		//���ý������ݵ�rx-payload�Ĵ�������Ч���ݵĿ�� (Bit[7:6]û��RX_PWR[5:0] Ĭ��ֵ 0010_0000 : 0x20)
#define NRF905SE_RRX_PW 0x13		//��ȡ�������ݵ�rx-payload�Ĵ�������Ч���ݵĿ�� (Bit[7:6]û��RX_PWR[5:0] Ĭ��ֵ 0010_0000 : 0x20)

#define NRF905SE_WTX_PW 0x04		//���ý������ݵ�tx-payload�Ĵ�������Ч���ݵĿ�� (Bit[7:6]û��RX_PWR[5:0] Ĭ��ֵ 0010_0000 : 0x20)	
#define NRF905SE_RTX_PW 0x14		//��ȡ�������ݵ�tx-payload�Ĵ�������Ч���ݵĿ�� (Bit[7:6]û��RX_PWR[5:0] Ĭ��ֵ 0010_0000 : 0x20)

#define NRF905SE_WRA	0x05		// ����λ�����üĴ�����5-8��4���ֽڵ�Rx-Address (write RX-Address)
#define NRF905SE_RRA	0x15		// ��ȡλ�����üĴ�����5-8��4���ֽڵ�Rx-Address	(read Rx-Address)

#define NRF905SE_WCRC 	0x09 	// ����CRC У���ģʽ
#define NRF905SE_RCRC 	0x19 	// ��ȡCRC У���ģʽ


#define NRF905SE_WTP	0x20		// ��TX-Payload �Ĵ���д����Ч���� (write the payload data to the Tx-payload register)
#define NRF905SE_RTP 	0x21		// ��Tx-payload �Ĵ����ж�����Ч���� read the payload data in the Tx-payload register)

#define NRF905SE_WTA 	0x22		// ��Tx-Address �Ĵ���д�뷢�͵�ַ����Ŀ���ַ(write the destination address in the Tx-Address register)
#define NRF905SE_RTA	0x23		// ��Tx-Address	�Ĵ�����ȡ���͵�ַ��(read the destination address from the Tx-Address register)

#define NRF905SE_RRP	0x24		// ��Tx-Payload �Ĵ����ж�ȡ���յ�����Ч����(read the payload data from the Rx-Payload register)



/*------------ NRF905SE     functions ---------------------------------------*/



void NRF905SE_SetRxMode(void);
void NRF905SE_SetTxMode(void);

bool NRF905SE_RxPacket(void);
bool NRF905SE_TxPacket(void);



void NRF905SE_Configuration(void);
void NRF905SE_EXTI_DoIt(void);


/*****NRF905SE��ʼ������������Ĭ�����ü����͡����յ�ַ****/
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

//�ⲿ�жϴ�����
void  NRF905SE_EXTI_DoIt();








#endif  /** END OF DEFINE __NRF905SE_H_ ****/

