/******************** (C) COPYRIGHT 2011 SDUEM ********************
* File Name          : hw_config.h
* Author             : wzb@sduem
* Version            : V2.2.0
* Date               : 05/13/2011
* Description        : Hardware Configuration & Setup
*******************************************************************************/

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __HW_CONFIG_H
#define __HW_CONFIG_H

/* Includes ------------------------------------------------------------------*/
#include "stm32f10x_lib.h"

/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/
/* Exported variables --------------------------------------------------------*/
extern u32 TimingDelay;  // delay used!
/* Exported macro ------------------------------------------------------------*/
/* Exported define -----------------------------------------------------------*/


#if 0
//------------define the usart using-----------
#define USART_USING                  USART1
#define RCC_APB2Periph_USART_USING   RCC_APB2Periph_USART1
#define USART_USING_IRQChannel       USART1_IRQChannel

//--------------define USART pins-------------------
#define USART_RX_PIN     GPIO_Pin_10
#define USART_TX_PIN     GPIO_Pin_9

//------------define the SPI using-----------
#define SPI_USING                  SPI1
#define RCC_APB2Periph_SPI_USING   RCC_APB2Periph_SPI1
#define SPI_USING_IRQChannel       SPI1_IRQChannel

//--------------define SPI pins-------------------
#define SPI_SCK_PIN     GPIO_Pin_5
#define SPI_MISO_PIN    GPIO_Pin_6
#define SPI_MOSI_PIN    GPIO_Pin_7

//-------------------define the GPIO for USART_USING------------------
#define GPIO_FOR_USART    GPIOA


//-------------------define the GPIO for SPI_USING------------------
#define GPIO_FOR_SPI      GPIOA

#endif


/* Exported functions ------------------------------------------------------- */
void System_Init(void);
void RCC_Configuration(void); /*****与时钟相关的寄存器配制*****/
void USART_Configuration(void);
void SPI_Configuration(void);

//usart 送往超级终端上的字符显示
void usart_putc(u8 ch) ;
void usart_puts(u8  str[]) ;
void usart_println(void);
void usart_cls();
void usart_printArray( u8 * array, u32 arraySize) ;
void USART_EXTI_DoIt();   // Usart外部中断

void Decrement_TimingDelay(void);
void delay_us(u32 nCount);

/* External variables --------------------------------------------------------*/

#endif  /*__HW_CONFIG_H*/

/******************* (C) COPYRIGHT 2011 SDUEM *****END OF FILE****/
