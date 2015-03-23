/******************** (C) COPYRIGHT 2011 SDUEM ********************
* File Name          : hw_config.c
* Author             : wzb@SDUEM
* Version            : V2.2.0
* Date               : 05/13/2011
* Description        : Hardware Configuration & Setup
********************************************************************************
*
*******************************************************************************/


/* Includes ------------------------------------------------------------------*/
#include "hw_config.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/


/* Extern variables ----------------------------------------------------------*/

/* Exported variables ----------------------------------------------------------*/
u32 TimingDelay;

/* Private function prototypes -----------------------------------------------*/
static void SysTick_Configuration(void);

static void USART1_GPIO_Configuration();
static void USART1_NVIC_Configuration();
static void USART1_Configuration();

static void SPI1_GPIO_Configuration();
static void SPI1_NVIC_Configuration();
static void SPI1_Configuration();


/* ----------------------Exported functions ----------------------------------*/


/* ---------------RCC Configuration fuction -----------------------------------*/
/*******************************************************************************
* Function Name  : RCC_Configuration
* Description    : Configures the  system clocks
* Input          : None.
* Return         : None.
*******************************************************************************/

//RCCʱ������ for the whole system
 void RCC_Configuration(void) {
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

         //��GPIOA AFIO USART1 SPI1 ʱ�ӣ����ù��ܣ�����1��ʱ��
         RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA  | RCC_APB2Periph_GPIOB | RCC_APB2Periph_AFIO | RCC_APB2Periph_USART1 | RCC_APB2Periph_SPI1, ENABLE);

}

/*******************************************************************************
* Function Name  : RCC_Configuration_1
* Description    : Configures the  system clocks
* Input          : None.
* Return         : None.
*******************************************************************************/
void RCC_Configuration_1(void)
{
      ErrorStatus HSEStartUpStatus;
      /* RCC system reset(for debug purpose) */
      RCC_DeInit();	   //��RCC�Ĵ����豸ȱʡֵ

      /* Enable HSE */
      RCC_HSEConfig(RCC_HSE_ON);  //�ⲿ��������HSE ����

      /* Wait till HSE is ready */
      HSEStartUpStatus = RCC_WaitForHSEStartUp();	//�ȴ�HSE����

      if (HSEStartUpStatus == SUCCESS)	  //���HSE�����ȶ��Ҿ���
      {
          /* Enable Prefetch Buffer */
          FLASH_PrefetchBufferCmd(FLASH_PrefetchBuffer_Enable);  //Ԥȡָ����ʹ��
          /* Flash 2 wait state */
          FLASH_SetLatency(FLASH_Latency_2);	//����FLASH�洢����ʱʱ��������Ϊ2��ʱ����
          /* HCLK = SYSCLK */
          RCC_HCLKConfig(RCC_SYSCLK_Div1);  //����AHBʱ�ӣ�ϵͳʱ��
          /* PCLK2 = HCLK */
          RCC_PCLK2Config(RCC_HCLK_Div1);	 //����APB2ʱ�� �� HCLK
          /* PCLK1 = HCLK/2 */
          RCC_PCLK1Config(RCC_HCLK_Div2);	   //����APB1ʱ�� �� HCLK/2
          /* ADCCLK = PCLK2/6 */
          RCC_ADCCLKConfig(RCC_PCLK2_Div6);	//����ADCʱ�ӣ�PCLK/6

          //PLL����
          //PLL����ʱ�ӣ�HSEʱ��Ƶ��   ��� 9��Ƶ��HSE��9��
          RCC_PLLConfig(RCC_PLLSource_HSE_Div1, RCC_PLLMul_9);     //72M
          /* Enable PLL */
          RCC_PLLCmd(ENABLE);

          /* Wait till PLL is ready */
          while (RCC_GetFlagStatus(RCC_FLAG_PLLRDY) == RESET);	 //�ȴ�PLL����

          /* Select PLL as system clock source */
          RCC_SYSCLKConfig(RCC_SYSCLKSource_PLLCLK);	//ѡ��PLL��Ϊϵͳʱ��

          /* Wait till PLL is used as system clock source */
              //�ȴ�����ϵͳʱ��ΪPLL�ɹ�
              //����ֵΪ	00��HSI  04��HSE  08��PLL
          while (RCC_GetSYSCLKSource() != 0x08);
      }

        RCC_APB2PeriphClockCmd( RCC_APB2Periph_GPIOA | RCC_APB2Periph_GPIOB |RCC_APB2Periph_AFIO | RCC_APB2Periph_SPI1 | RCC_APB2Periph_USART1  , ENABLE);
        SysTick_Configuration();
}


/*******************************************************************************
* Function Name  : SysTick_Configuration
* Description    : Configure a SysTick Base time to 10 ms.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
static  void SysTick_Configuration(void)
{
  /* Configure HCLK clock as SysTick clock source */
  SysTick_CLKSourceConfig(SysTick_CLKSource_HCLK);	//����SysTickʱ��ΪAHBʱ��

  /* SysTick interrupt each 72Hz with HCLK equal to 72MHz */
  SysTick_SetReload(72);   //������װֵ

  /* Enable the SysTick Interrupt */
  SysTick_ITConfig(ENABLE);
}

/*******************************************************************************
* Function Name  : delay_us
* Description    : Inserts a delay time.
* Input          : nCount: specifies the delay time length (time base 1 us).
* Output         : None
* Return         : None
*******************************************************************************/
void delay_us(u32 nCount)
{
   TimingDelay = nCount;

  /* Enable the SysTick Counter */
  SysTick_CounterCmd(SysTick_Counter_Enable);

  while(TimingDelay != 0);

  /* Disable the SysTick Counter */
  SysTick_CounterCmd(SysTick_Counter_Disable);

  /* Clear the SysTick Counter */
  SysTick_CounterCmd(SysTick_Counter_Clear);
}

/*******************************************************************************
* Function Name  : Decrement_TimingDelay
* Description    : Decrements the TimingDelay variable.
* Input          : None
* Output         : TimingDelay
* Return         : None
*******************************************************************************/
void Decrement_TimingDelay(void)
{
	if (TimingDelay != 0x00)
	{
		TimingDelay--;
	}
}

/* --------------- End of RCC Configuration fuction --------------------------*/


/* ---------------USART Configuration fuction --------------------------------*/
/*******************************************************************************
* Function Name  : USART_Configuration
* Description    : Configures the  system clocks
* Input          : None.
* Return         : None.
*******************************************************************************/
void USART_Configuration(void) {
	  USART1_GPIO_Configuration();
	  USART1_NVIC_Configuration();
	  USART1_Configuration();
}

/* ---------------SPI Configuration fuction ----------------------------------*/
/*******************************************************************************
* Function Name  : SPI_Configuration
* Description    : Configures the  system clocks
* Input          : None.
* Return         : None.
*******************************************************************************/
void SPI_Configuration(void) {
    SPI1_GPIO_Configuration();
    SPI1_NVIC_Configuration();
    SPI1_Configuration();
}

/* ---------------System initial Configuration fuction ------------------------------------------*/
/*******************************************************************************
* Function Name  : System_Init
* Description    : Configures the  system ;
* Input          : None.
* Return         : None.
*******************************************************************************/
void System_Init(void)
{
      /* RCC configuration */
  	RCC_Configuration();		 /*****��ʱ����صļĴ�������*****/
        USART_Configuration();
   	SPI_Configuration();
}
/* -------------------End of Exported functions ----------------------------------*/




/* --------------private Configuration fuction for USART ------------------------------------------*/

/*******************************************************************************
* Function Name  : USART1_GPIO_Configuration
* Description    : Configures the  USART1 GPIO Port and Pin
* Input          : None.
* Return         : None.
*******************************************************************************/
//GPIO������ for USART1
static void USART1_GPIO_Configuration(void){		
       GPIO_InitTypeDef GPIO_InitStructure;

        //��GPIOʱ�ӣ����ù��ܣ�����1��ʱ��
       RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA  | RCC_APB2Periph_AFIO , ENABLE);

	//PA9��ΪUSART1��TX�ˣ��򿪸��ã�����������
       GPIO_StructInit(&GPIO_InitStructure);
	
       GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;	
       GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
       GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
       GPIO_Init(GPIOA, &GPIO_InitStructure);

       //PA10��ΪUSART1��RX�ˣ������������
       GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;	
       GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
       GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
       GPIO_Init(GPIOA, &GPIO_InitStructure);
}

/*******************************************************************************
* Function Name  : USART1_NVIC_Configuration
* Description    : Configures the  USART1 NVIC
* Input          : None.
* Return         : None.
*******************************************************************************/
//�����ж� for USART1
static void USART1_NVIC_Configuration() {
        // NVIC init
        #ifdef VEC_TAB_RAM
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

/*******************************************************************************
* Function Name  : USART1_Configuration
* Description    : Configures the  USART1 Configuration and enable set
* Input          : None.
* Return         : None.
*******************************************************************************/
//���ڳ�ʼ�� for USART1
static  void USART1_Configuration() {		
	
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

          //�رմ���1���ж���Ӧ����
       //USART_ITConfig(USART1, USART_IT_RXNE,  DISABLE);
}

/* -------------- End of private Configuration fuction for USART -------------*/


/* --------------private Configuration fuction for SPI------------------------*/
/*******************************************************************************
* Function Name  :SPI1_GPIO_Configuration
* Description    : Configures the SPI1 Configuration and enable set
* Input          : None.
* Return         : None.
*******************************************************************************/
//  SPI1 GPIO ����
static void SPI1_GPIO_Configuration(void) {

      GPIO_InitTypeDef GPIO_InitStructure;

      /*ʹ��SPI1��ʱ�ӣ�����ӿڵ�ʱ�ӹ���APB2��*/
      RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA | RCC_APB2Periph_AFIO, ENABLE);

      /* ����SPI1���������: MOSI(PA.07)��SCK(PA.05)���� */
      GPIO_StructInit(&GPIO_InitStructure);
      GPIO_InitStructure.GPIO_Pin = GPIO_Pin_7 | GPIO_Pin_5;    //SPI_MOSI_PIN | SPI_SCK_PIN
      GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;           //push-pull alternate function output mode
      GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;         // the speed mode configer
      GPIO_Init(GPIOA, &GPIO_InitStructure);

      /* ����SPI1����������:SPI1  MISO (PA.06) configuration */
      GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6;                 //SPI_MISO_PIN
      GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
      GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
      GPIO_Init(GPIOA, &GPIO_InitStructure);
}

/*******************************************************************************
* Function Name  :SPI1_NVIC_Configuration
* Description    : Configures the  USART1 Configuration and enable set
* Input          : None.
* Return         : None.
*******************************************************************************/
//SPI1 NVIC ����
static void SPI1_NVIC_Configuration(void) {
          // NVIC init
          #ifdef VEC_TAB_RAM
            /* Set the Vector Table base location at 0x20000000 */
            NVIC_SetVectorTable(NVIC_VectTab_RAM, 0x0);
          #else  /* VECT_TAB_FLASH  */
            /* Set the Vector Table base location at 0x08000000 */
            NVIC_SetVectorTable(NVIC_VectTab_FLASH, 0x0);
          #endif

          #if 0
          //�����ж����ȼ�
          NVIC_PriorityGroupConfig(NVIC_PriorityGroup_1);

          NVIC_InitTypeDef NVIC_InitStructure;
          /* Enable SPI1 Interrupt */
          NVIC_InitStructure.NVIC_IRQChannel = SPI1_IRQChannel;        /****SPI1_IRQChannel**/
          NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 1;
          NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
          NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
          NVIC_Init(&NVIC_InitStructure);
    #endif
}

/*******************************************************************************
* Function Name  : SPI1_Configuration
* Description    : Configures the  SPI1 Configuration and enable set
* Input          : None.
* Return         : None.
*******************************************************************************/
// SPI1 ������
static void SPI1_Configuration(void) {

      SPI_InitTypeDef  SPI_InitStructure;

       RCC_APB2PeriphClockCmd(RCC_APB2Periph_SPI1, ENABLE);
      SPI_StructInit(&SPI_InitStructure);

      /** SPI1 Configuration ****************/
      SPI_InitStructure.SPI_Direction = SPI_Direction_2Lines_FullDuplex;/****ȫ˫��ģʽ****/
      SPI_InitStructure.SPI_Mode = SPI_Mode_Master;                     /****��ģʽ********/
      SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;                /**���ݳ���Ϊ1�ֽ�**/
      SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;               /**ÿ���ֽڸ�λ��ǰ**/
      SPI_InitStructure.SPI_CPOL = SPI_CPOL_Low;                       /**����ʱ���ڵ͵�ƽ**/
      /**SPI_InitStructure.SPI_CPHA = SPI_CPHA_2Edge;  **/             /**�ӵڶ���ʱ�����ڿ�ʼ����*/
      SPI_InitStructure.SPI_CPHA = SPI_CPHA_1Edge;                    /***�ӵ�һ��ʱ�����ڿ�ʼ����**/
      SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;
      SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_8;
      SPI_InitStructure.SPI_CRCPolynomial = 7;

      SPI_Init(SPI1, &SPI_InitStructure);

      /* Enable SPI1 CRC calculation */
      //SPI_CalculateCRC(SPI_USING, DISABLE);  //ʹ��RCC����
      //SPI_I2S_ITConfig(SPI_USING, SPI_I2S_IT_RXNE, DISABLE);  //�رս����жϣ�
      //SPI_I2S_ITConfig(SPI_USING, SPI_I2S_IT_TXE, DISABLE);   //�رշ����ж�

      SPI_Cmd(SPI1, ENABLE);           //ʹ��SPI1

}


void usart_putc(u8 ch) {
  while( USART_GetFlagStatus(USART1, USART_FLAG_TXE) == RESET );
  USART_SendData(USART1, ch);
}

void usart_puts(u8  str[]) {
  while(*str != '\0' ) {
      usart_putc(* str++);
  }
}

void usart_println(void) {
  usart_putc('\n');
  usart_putc('\r');
}

void usart_cls() {
  usart_putc(0x0c);
  usart_putc(0x0c);
}

void usart_printArray( u8 * array, u32 arraySize) {
  for(int i=0; i<arraySize; i++) {
      usart_putc(* array++);
  }
}

void USART_EXTI_DoIt(){
	if( USART_GetFlagStatus(USART1, USART_FLAG_RXNE) == SET ) {
		
      u8 ch = USART_ReceiveData(USART1);
      USART_SendData(USART1, ch);
      while( USART_GetFlagStatus(USART1, USART_FLAG_TXE) == RESET );

      if(ch == '\r') {
          USART_SendData(USART1, '\n');
          while( USART_GetFlagStatus(USART1, USART_FLAG_TXE));

      }

  }

}


/* ------------End of private Configuration fuction for SPI-------------------*/
/***--------------------------Expired functions--------------------------------------*/


/******************* (C) COPYRIGHT 2011 SDUEM *****END OF FILE****/
