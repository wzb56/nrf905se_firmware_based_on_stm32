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

//RCCʱ������
void RCC_Configuration(){
       //�������״̬����
       ErrorStatus HSEStartUpStatus;
	
       //��RCC�Ĵ�����������ΪĬ��ֵ
       RCC_DeInit();

       //���ⲿ����ʱ�Ӿ���
       RCC_HSEConfig(RCC_HSE_ON);

       //�ȴ��ⲿ����ʱ�Ӿ�����
       HSEStartUpStatus = RCC_WaitForHSEStartUp();

       if(HSEStartUpStatus == SUCCESS) {

              //����AHBʱ��(HCLK)Ϊϵͳʱ��
              RCC_HCLKConfig(RCC_SYSCLK_Div1);

              //���ø���AHBʱ��(APB2)ΪHCLKʱ��
              RCC_PCLK2Config(RCC_HCLK_Div1);

              //���õ���AHBʱ��(APB1)ΪHCLK��2��Ƶ
              RCC_PCLK1Config(RCC_HCLK_Div2);

              //����FLASH������ʱ
              FLASH_SetLatency(FLASH_Latency_2);

              //ʹ��Ԥȡָ����
              FLASH_PrefetchBufferCmd(FLASH_PrefetchBuffer_Enable);

              //����PLLʱ�ӣ�ΪHSE��9��Ƶ 8MHz * 9 = 72MHz
              RCC_PLLConfig(RCC_PLLSource_HSE_Div1, RCC_PLLMul_9);
			
              //ʹ��PLL
              RCC_PLLCmd(ENABLE);

              //�ȴ�PLL׼������
              while(RCC_GetFlagStatus(RCC_FLAG_PLLRDY) == RESET);
              //����PLLΪϵͳʱ��Դ
              RCC_SYSCLKConfig(RCC_SYSCLKSource_PLLCLK);
              //�ж�PLL�Ƿ���ϵͳʱ��
              while(RCC_GetSYSCLKSource() != 0x08);
       }

         //��GPIOʱ�ӣ����ù��ܣ�����1��ʱ��
         RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA  | RCC_APB2Periph_AFIO | RCC_APB2Periph_USART1, ENABLE);

}



//GPIO������
void GPIO_Configuration(){		
       GPIO_InitTypeDef GPIO_InitStructure;

	   //��GPIOʱ�ӣ����ù��ܣ�����1��ʱ��
       RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA  | RCC_APB2Periph_AFIO , ENABLE);

	   //PA9��ΪUSart1��TX�ˣ��򿪸��ã�����������
       GPIO_StructInit(&GPIO_InitStructure);	
       GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;
       GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
       GPIO_Init(GPIOA, &GPIO_InitStructure);

       //PA10��ΪUS1��RX�ˣ������������
       GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;
       GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
       GPIO_Init(GPIOA, &GPIO_InitStructure);
}



//���ڳ�ʼ��
void USART_Configuration() {
       USART_InitTypeDef USART_InitStructure;

	   //��USART1ʱ�ӣ�����1��ʱ��
       RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);
       //���ṹ������Ϊȱʡ״̬
       USART_StructInit(&USART_InitStructure);
	
    	//����������Ϊ115200
       USART_InitStructure.USART_BaudRate = 115200;
       //һ֡���ݵĿ������Ϊ8bits
       USART_InitStructure.USART_WordLength = USART_WordLength_8b;
       //��֡��β����1��ֹͣλ
       USART_InitStructure.USART_StopBits = USART_StopBits_1;
       //��żʧ��ģʽ������żУ��
       USART_InitStructure.USART_Parity = USART_Parity_No;
       //����/����ʹ��
       USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
       //Ӳ��������ʧ��
       USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
       //���ô���1
       USART_Init(USART1, &USART_InitStructure);
	
       //�򿪴���1���ж���Ӧ����
       USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);
       //�򿪴���1
       USART_Cmd(USART1, ENABLE);
}



//�����ж�

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
		
        NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);   //ѡ���жϷ���2

        NVIC_InitStructure.NVIC_IRQChannel = USART1_IRQChannel;    //ѡ�񴮿�1�ж�
        NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;  //��ռʽ�ж����ȼ�����Ϊ0
        NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;         //��Ӧʽ�ж����ȼ�����Ϊ0
        NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;           //ʹ���ж�
        NVIC_Init(&NVIC_InitStructure);

}





//Ȼ����stm32f10x_it.c�ļ����ҵ���Ӧ���жϴ�������������һ�����ݡ�
//ע����stm32f10x_it.c�У�Ҫ����һ���ⲿ����RX_status
/*
void USART1_IRQHandler(void) {	
       GPIO_SetBits(GPIOB, GPIO_Pin_5);
       //ȷ���Ƿ���յ�����
       RX_status = USART_GetFlagStatus(USART1, USART_FLAG_RXNE);
       //���յ�����
       if(RX_status == SET) {
              //�����ݻ����������ն�
              USART_SendData(USART1, USART_ReceiveData(USART1));
              //�ȴ����ݷ������
              while(USART_GetFlagStatus(USART1, USART_FLAG_TC) == RESET);
              GPIO_ResetBits(GPIOB, GPIO_Pin_5);
       }
}
*/
