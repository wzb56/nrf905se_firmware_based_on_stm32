## nrf905se基于stm32的固件库api (firmware)
-----------------------------------------

0. 基于stm32的nrf905se(433MHZ) 的firmware。

1. 工程是基于IAR的IDE开发完成。

2. 有2个目录一个send， 一个receive, 是2个独立的工程。

3. nrf905se的相关代码位于app目录中。

4. 具体硬件的板子的配置可能略有差别：如GPIO等。

5. 代码的目录tree结构如下：

```
.
|-- READ.md
|-- receive
|   |-- Debug
|   |   |-- Exe
|   |   |-- List
|   |   `-- Obj
|   |-- STM3210E-EVAL_Demo.dep
|   |-- STM3210E-EVAL_Demo.ewd
|   |-- STM3210E-EVAL_Demo.ewp
|   |-- STM32_Camera_Demo.eww
|   |-- app
|   |   |-- hw_config.c
|   |   |-- hw_config.c_bak
|   |   |-- hw_config.h
|   |   |-- includes.h
|   |   |-- log.txt
|   |   |-- main.c
|   |   |-- nrf905.c
|   |   |-- nrf905.h
|   |   |-- stm32f10x_conf.h
|   |   |-- stm32f10x_it.c
|   |   |-- stm32f10x_it.h
|   |   |-- stm32f10x_vector.c
|   |   |-- usart.c
|   |   `-- usart.h
|   |-- board
|   |   |-- cortexm3_macro.s
|   |   |-- log.txt
|   |   `-- stm32f10x_vector.c
|   |-- config
|   |   `-- stm32f10x_flash.icf
|   |-- library
|   |   |-- inc
|   |   `-- src
|   |-- log.txt
|   `-- settings
|       |-- STM3210E-EVAL_Demo.cspy.bat
|       |-- STM3210E-EVAL_Demo.dbgdt
|       |-- STM3210E-EVAL_Demo.dni
|       |-- STM3210E-EVAL_Demo.wsdt
|       |-- STM3210E-EVAL_Demo_Debug.jlink
|       `-- STM32_Camera_Demo.wsdt
`-- send
    |-- Debug
    |   |-- Exe
    |   |-- List
    |   `-- Obj
    |-- STM3210E-EVAL_Demo.dep
    |-- STM3210E-EVAL_Demo.ewd
    |-- STM3210E-EVAL_Demo.ewp
    |-- STM32_Camera_Demo.eww
    |-- app
    |   |-- hw_config.c
    |   |-- hw_config.c_bak
    |   |-- hw_config.h
    |   |-- includes.h
    |   |-- log.txt
    |   |-- main.c
    |   |-- nrf905.c
    |   |-- nrf905.h
    |   |-- stm32f10x_conf.h
    |   |-- stm32f10x_it.c
    |   |-- stm32f10x_it.h
    |   |-- stm32f10x_vector.c
    |   |-- usart.c
    |   `-- usart.h
    |-- board
    |   |-- cortexm3_macro.s
    |   |-- log.txt
    |   `-- stm32f10x_vector.c
    |-- config
    |   `-- stm32f10x_flash.icf
    |-- library
    |   |-- inc
    |   `-- src
    |-- log.txt
    `-- settings
        |-- STM3210E-EVAL_Demo.cspy.bat
        |-- STM3210E-EVAL_Demo.dbgdt
        |-- STM3210E-EVAL_Demo.dni
        |-- STM3210E-EVAL_Demo.wsdt
        |-- STM3210E-EVAL_Demo_Debug.jlink
        `-- STM32_Camera_Demo.wsdt
```
