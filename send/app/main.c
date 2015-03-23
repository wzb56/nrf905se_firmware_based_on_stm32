/******************** (C) COPYRIGHT 2011 SDU EMLIB ********************
* File Name          : main.c
* Author             : wzb@sdu
* Version            : V1.1.1
* Date               : 05/24/2011
* Description        : USART1 communictate with pc  AND NRF905SE.
********************************************************************************/


/* Includes ------------------------------------------------------------------*/
#include "hw_config.h"
#include "nrf905.h"


/*************************************************************************
 * Function Name: main
 * Parameters: none
 *
 * Return: none
 *
 * Description: main
 *
 *************************************************************************/
void main(void)
{
#ifdef DEBUG
  debug();
#endif

 	
	   RCC_Configuration();
	   USART_Configuration();
       SPI_Configuration();
       NRF905SE_Configuration();

    // send packet

#if 1
     u8 tx_array[4];
     u8 rx_array[4];
     //NRF905SE_GetRxAddress(rx_array, 4);
     //NRF905SE_GetTxAddress(tx_array, 4);

	 NRF905SE_GetRxAddress(rx_array, NRF905SE_GetRxAddressSize());
     NRF905SE_GetTxAddress(tx_array, NRF905SE_GetTxAddressSize());
	
     usart_cls();
     usart_puts("我是发送者， 我的地址是: ");
	 usart_printArray(rx_array, NRF905SE_GetRxAddressSize());
     usart_println();
     usart_puts("this is the NRF905SE transfer for send data, its info are as follows: ");
     usart_println();
     usart_puts("我的接收地址： ");
     usart_printArray(rx_array, NRF905SE_GetRxAddressSize());
     usart_println();

     usart_puts("我的向目标地址：");
     usart_printArray(tx_array, NRF905SE_GetTxAddressSize());
     usart_puts("发送数据");
     usart_println();

     //NRF905SE_SendPacket(NRF905SE_TxBuffer, NRF905SE_BufferSize); /*****发送32字节的数据包*****/
	  u8 n = 48;
     u8 payload_array[32];
	 u8 payloadSize = NRF905SE_GetTxPayloadSize();
	
	 //NRF905SE_SendPacket(NRF905SE_TxBuffer, NRF905SE_GetTxPayloadSize());
	 NRF905SE_SendPacket(NRF905SE_TxBuffer, payloadSize);
	

     while(1) {
        if(n== 58)  {
              n -= 10;
              usart_println();
          }
		
         usart_puts("发包：(");
         usart_putc(n++);
         usart_puts(")");
         NRF905SE_GetTxPayload( payload_array, payloadSize);
         usart_printArray(payload_array, payloadSize);
         usart_println();

         if(n %2 == 0) {
           for(int i=0; i<payloadSize; i++) {
              payload_array[i] -= 1;
           }
         }
         else {
             for(int i=0; i<payloadSize; i++) {
              payload_array[i] += 1;
           }
         }
		
		  NRF905SE_SendPacket(payload_array, payloadSize);	
         //NRF905SE_SetTxPayload(payload_array, payloadSize);		
         //NRF905SE_SendData();

         /*
         for(u32 i=0; i<1000; i++) {
            for(u32 j = 0; j<1000; j++)
              for(u32 k=0; k<5; k++);

         }
        */

     }
#endif
	
	 //receive data

#if 0

     NRF905SE_SetRxAddress("1234", 4);
     NRF905SE_SetTxAddress("0123", 4);

     u8 tx_array[4];
     u8 rx_array[4];
     NRF905SE_GetRxAddress(rx_array, 4);
     NRF905SE_GetTxAddress(tx_array, 4);

     usart_cls();
     usart_puts("this is the NRF905SE transfer for receive data, its info are as follows: ");
     usart_println();
     usart_puts("我的接收地址： ");
     usart_printArray(rx_array, 4);
     usart_println();

     usart_puts("我的目标发送地址：");
     usart_printArray(tx_array, 4);
     usart_println();
     usart_puts("我开始接受来自发射器：");
     usart_printArray(tx_array, 4);
     usart_puts("发送来的数据：");
     usart_println();

	u8 payloadSize = NRF905SE_GetRxPayloadSize();
    u8 n = 48;
	while(1) {
		/*****发送32字节的数据包*****/
          if(n== 58 )  {
              n -= 10;
              usart_println();
          }
		if(NRF905SE_ReceivePacket(NRF905SE_RxBuffer, payloadSize) ) {
                    usart_puts("收包(");
                    usart_putc(n++);
                    usart_puts("): ");

                    usart_printArray(NRF905SE_RxBuffer, payloadSize);


                     usart_println();
		}




	}

#endif
	

	
	
	
	
  while(1);



}


#ifdef  DEBUG
/*******************************************************************************
* Function Name  : assert_failed
* Description    : Reports the name of the source file and the source line number
*                  where the assert_param error has occurred.
* Input          : - file: pointer to the source file name
*                  - line: assert_param error line source number
* Output         : None
* Return         : None
*******************************************************************************/
void assert_failed(u8* file, u32 line)
{
volatile bool Flag = TRUE;
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (Flag )
  {
  }
}
#endif