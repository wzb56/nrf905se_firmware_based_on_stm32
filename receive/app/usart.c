/******************** (C) COPYRIGHT 2008 STMicroelectronics ********************
* File Name          : usart.c
* Author             : wzb@sdu
* Version            : V1.1.1
* Date               : 05/24/2011
* Description        : USART1 configuration functions implemented file.
********************************************************************************/



/* Includes ------------------------------------------------------------------*/
#include "usart.h"


/* Exported functions implementations****************************************************/

//RCC时钟配置
void RCC_Configuration(){
       //定义错误状态变量
       ErrorStatus HSEStartUpStatus;
	
       //将RCC寄存器重新设置为默认值
       RCC_DeInit();

       //打开外部高速时钟晶振
       RCC_HSEConfig(RCC_HSE_ON);

       //等待外部高速时钟晶振工作
       HSEStartUpStatus = RCC_WaitForHSEStartUp();

       if(HSEStartUpStatus == SUCCESS) {

              //设置AHB时钟(HCLK)为系统时钟
              RCC_HCLKConfig(RCC_SYSCLK_Div1);

              //设置高速AHB时钟(APB2)为HCLK时钟
              RCC_PCLK2Config(RCC_HCLK_Div1);

              //设置低速AHB时钟(APB1)为HCLK的2分频
              RCC_PCLK1Config(RCC_HCLK_Div2);

              //设置FLASH代码延时
              FLASH_SetLatency(FLASH_Latency_2);

              //使能预取指缓存
              FLASH_PrefetchBufferCmd(FLASH_PrefetchBuffer_Enable);

              //设置PLL时钟，为HSE的9倍频 8MHz * 9 = 72MHz
              RCC_PLLConfig(RCC_PLLSource_HSE_Div1, RCC_PLLMul_9);
			
              //使能PLL
              RCC_PLLCmd(ENABLE);

              //等待PLL准备就绪
              while(RCC_GetFlagStatus(RCC_FLAG_PLLRDY) == RESET);
              //设置PLL为系统时钟源
              RCC_SYSCLKConfig(RCC_SYSCLKSource_PLLCLK);
              //判断PLL是否是系统时钟
              while(RCC_GetSYSCLKSource() != 0x08);
       }

         //打开GPIO时钟，复用功能，串口1的时钟
         RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA  | RCC_APB2Periph_AFIO | RCC_APB2Periph_USART1, ENABLE);

}



//GPIO口配置
void GPIO_Configuration(){		
       GPIO_InitTypeDef GPIO_InitStructure;

	   //打开GPIO时钟，复用功能，串口1的时钟
       RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA  | RCC_APB2Periph_AFIO , ENABLE);

	   //PA9作为USart1的TX端，打开复用，负责发送数据
       GPIO_StructInit(&GPIO_InitStructure);	
       GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;
       GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
       GPIO_Init(GPIOA, &GPIO_InitStructure);

       //PA10作为US1的RX端，负责接收数据
       GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;
       GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
       GPIO_Init(GPIOA, &GPIO_InitStructure);
}



//串口初始化
void USART_Configuration() {
       USART_InitTypeDef USART_InitStructure;

	   //打开USART1时钟，串口1的时钟
       RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);
       //将结构体设置为缺省状态
       USART_StructInit(&USART_InitStructure);
	
    	//波特率设置为115200
       USART_InitStructure.USART_BaudRate = 115200;
       //一帧数据的宽度设置为8bits
       USART_InitStructure.USART_WordLength = USART_WordLength_8b;
       //在帧结尾传输1个停止位
       USART_InitStructure.USART_StopBits = USART_StopBits_1;
       //奇偶失能模式，无奇偶校验
       USART_InitStructure.USART_Parity = USART_Parity_No;
       //发送/接收使能
       USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
       //硬件流控制失能
       USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
       //设置串口1
       USART_Init(USART1, &USART_InitStructure);
	
       //打开串口1的中断响应函数
       USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);
       //打开串口1
       USART_Cmd(USART1, ENABLE);
}



//配置中断

void NVIC_Configuration() {
// NVIC init
#ifdef  vec_tab_ram
  /* Set the Vector Table base location at 0x20000000 */
  NVIC_SetVectorTable(NVIC_VectTab_RAM, 0x0);
#else  /* VECT_TAB_FLASH  */
  /* Set the Vector Table base location at 0x08000000 */
  NVIC_SetVectorTable(NVIC_VectTab_FLASH, 0x0);
#endif

        NVIC_InitTypeDef NVIC_InitStructure;
		
        NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);   //选择中断分组2

        NVIC_InitStructure.NVIC_IRQChannel = USART1_IRQChannel;    //选择串口1中断
        NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;  //抢占式中断优先级设置为0
        NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;         //响应式中断优先级设置为0
        NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;           //使能中断
        NVIC_Init(&NVIC_InitStructure);

}





//然后在stm32f10x_it.c文件中找到相应的中断处理函数，并填入一下内容。
//注意在stm32f10x_it.c中，要声明一下外部变量RX_status
/*
void USART1_IRQHandler(void) {	
       GPIO_SetBits(GPIOB, GPIO_Pin_5);
       //确认是否接收到数据
       RX_status = USART_GetFlagStatus(USART1, USART_FLAG_RXNE);
       //接收到数据
       if(RX_status == SET) {
              //将数据回送至超级终端
              USART_SendData(USART1, USART_ReceiveData(USART1));
              //等待数据发送完毕
              while(USART_GetFlagStatus(USART1, USART_FLAG_TC) == RESET);
              GPIO_ResetBits(GPIOB, GPIO_Pin_5);
       }
}
*/
