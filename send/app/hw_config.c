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

//RCC时钟配置 for the whole system
 void RCC_Configuration(void) {
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

         //打开GPIOA AFIO USART1 SPI1 时钟，复用功能，串口1的时钟
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
      RCC_DeInit();	   //将RCC寄存器设备缺省值

      /* Enable HSE */
      RCC_HSEConfig(RCC_HSE_ON);  //外部高速振荡器HSE 开启

      /* Wait till HSE is ready */
      HSEStartUpStatus = RCC_WaitForHSEStartUp();	//等待HSE启动

      if (HSEStartUpStatus == SUCCESS)	  //如果HSE晶振稳定且就绪
      {
          /* Enable Prefetch Buffer */
          FLASH_PrefetchBufferCmd(FLASH_PrefetchBuffer_Enable);  //预取指缓存使能
          /* Flash 2 wait state */
          FLASH_SetLatency(FLASH_Latency_2);	//设置FLASH存储器延时时钟周期数为2延时周期
          /* HCLK = SYSCLK */
          RCC_HCLKConfig(RCC_SYSCLK_Div1);  //设置AHB时钟＝系统时钟
          /* PCLK2 = HCLK */
          RCC_PCLK2Config(RCC_HCLK_Div1);	 //设置APB2时钟 ＝ HCLK
          /* PCLK1 = HCLK/2 */
          RCC_PCLK1Config(RCC_HCLK_Div2);	   //设置APB1时钟 ＝ HCLK/2
          /* ADCCLK = PCLK2/6 */
          RCC_ADCCLKConfig(RCC_PCLK2_Div6);	//设置ADC时钟＝PCLK/6

          //PLL设置
          //PLL输入时钟＝HSE时钟频率   输出 9倍频（HSE×9）
          RCC_PLLConfig(RCC_PLLSource_HSE_Div1, RCC_PLLMul_9);     //72M
          /* Enable PLL */
          RCC_PLLCmd(ENABLE);

          /* Wait till PLL is ready */
          while (RCC_GetFlagStatus(RCC_FLAG_PLLRDY) == RESET);	 //等待PLL就绪

          /* Select PLL as system clock source */
          RCC_SYSCLKConfig(RCC_SYSCLKSource_PLLCLK);	//选择PLL作为系统时钟

          /* Wait till PLL is used as system clock source */
              //等待设置系统时钟为PLL成功
              //返回值为	00：HSI  04：HSE  08：PLL
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
  SysTick_CLKSourceConfig(SysTick_CLKSource_HCLK);	//设置SysTick时钟为AHB时钟

  /* SysTick interrupt each 72Hz with HCLK equal to 72MHz */
  SysTick_SetReload(72);   //设置重装值

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
  	RCC_Configuration();		 /*****与时钟相关的寄存器配制*****/
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
//GPIO口配置 for USART1
static void USART1_GPIO_Configuration(void){		
       GPIO_InitTypeDef GPIO_InitStructure;

        //打开GPIO时钟，复用功能，串口1的时钟
       RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA  | RCC_APB2Periph_AFIO , ENABLE);

	//PA9作为USART1的TX端，打开复用，负责发送数据
       GPIO_StructInit(&GPIO_InitStructure);
	
       GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;	
       GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
       GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
       GPIO_Init(GPIOA, &GPIO_InitStructure);

       //PA10作为USART1的RX端，负责接收数据
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
//配置中断 for USART1
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
		
        NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);   //选择中断分组2
		
        NVIC_InitStructure.NVIC_IRQChannel = USART1_IRQChannel;    //选择串口1中断
        NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;  //抢占式中断优先级设置为0
        NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;         //响应式中断优先级设置为0
        NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;           //使能中断
        NVIC_Init(&NVIC_InitStructure);

}

/*******************************************************************************
* Function Name  : USART1_Configuration
* Description    : Configures the  USART1 Configuration and enable set
* Input          : None.
* Return         : None.
*******************************************************************************/
//串口初始化 for USART1
static  void USART1_Configuration() {		
	
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

          //关闭串口1的中断响应函数
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
//  SPI1 GPIO 配置
static void SPI1_GPIO_Configuration(void) {

      GPIO_InitTypeDef GPIO_InitStructure;

      /*使能SPI1的时钟，这个接口的时钟挂在APB2上*/
      RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA | RCC_APB2Periph_AFIO, ENABLE);

      /* 配置SPI1的输出引脚: MOSI(PA.07)、SCK(PA.05)引脚 */
      GPIO_StructInit(&GPIO_InitStructure);
      GPIO_InitStructure.GPIO_Pin = GPIO_Pin_7 | GPIO_Pin_5;    //SPI_MOSI_PIN | SPI_SCK_PIN
      GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;           //push-pull alternate function output mode
      GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;         // the speed mode configer
      GPIO_Init(GPIOA, &GPIO_InitStructure);

      /* 配置SPI1的输入引脚:SPI1  MISO (PA.06) configuration */
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
//SPI1 NVIC 配置
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
          //配置中断优先级
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
// SPI1 的配置
static void SPI1_Configuration(void) {

      SPI_InitTypeDef  SPI_InitStructure;

       RCC_APB2PeriphClockCmd(RCC_APB2Periph_SPI1, ENABLE);
      SPI_StructInit(&SPI_InitStructure);

      /** SPI1 Configuration ****************/
      SPI_InitStructure.SPI_Direction = SPI_Direction_2Lines_FullDuplex;/****全双工模式****/
      SPI_InitStructure.SPI_Mode = SPI_Mode_Master;                     /****主模式********/
      SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;                /**数据长度为1字节**/
      SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;               /**每个字节高位在前**/
      SPI_InitStructure.SPI_CPOL = SPI_CPOL_Low;                       /**空闲时处于低电平**/
      /**SPI_InitStructure.SPI_CPHA = SPI_CPHA_2Edge;  **/             /**从第二个时钟周期开始采样*/
      SPI_InitStructure.SPI_CPHA = SPI_CPHA_1Edge;                    /***从第一个时钟周期开始采样**/
      SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;
      SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_8;
      SPI_InitStructure.SPI_CRCPolynomial = 7;

      SPI_Init(SPI1, &SPI_InitStructure);

      /* Enable SPI1 CRC calculation */
      //SPI_CalculateCRC(SPI_USING, DISABLE);  //使能RCC计算
      //SPI_I2S_ITConfig(SPI_USING, SPI_I2S_IT_RXNE, DISABLE);  //关闭接收中断，
      //SPI_I2S_ITConfig(SPI_USING, SPI_I2S_IT_TXE, DISABLE);   //关闭发送中断

      SPI_Cmd(SPI1, ENABLE);           //使能SPI1

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
