/******************** (C) COPYRIGHT 2008 STMicroelectronics ********************
* File Name          : usart.h
* Author             : wzb@sdu
* Version            : V1.1.1
* Date               : 05/24/2011
* Description        : USART1 configuration file.
********************************************************************************/



/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __USART_H
#define __USART_H

/* Includes ------------------------------------------------------------------*/
#include "stm32f10x_lib.h"


/* Exported functions prototype****************************************************/

//RCC Clock configer
void RCC_Configuration(void);
void GPIO_Configuration(void);
void USART_Configuration(void);
void NVIC_Configuration(void);

#endif