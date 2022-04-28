/*
 * This example demonstrates using I2C with SSD1306
 * oled controller
 */

#include "stm32f0xx_ll_rcc.h"
#include "stm32f0xx_ll_system.h"
#include "stm32f0xx_ll_bus.h"
#include "stm32f0xx_ll_gpio.h"

#include "giro.h"
#include "I2C_configer.h"
#include "xprintf.h"
#include "oled_driver.h"

#include <stdlib.h>

/**
  * System Clock Configuration
  * The system Clock is configured as follow :
  *    System Clock source            = PLL (HSI/2)
  *    SYSCLK(Hz)                     = 48000000
  *    HCLK(Hz)                       = 48000000
  *    AHB Prescaler                  = 1
  *    APB1 Prescaler                 = 1
  *    HSI Frequency(Hz)              = 8000000
  *    PLLMUL                         = 12
  *    Flash Latency(WS)              = 1
  */
static void rcc_config()
{
    /* Set FLASH latency */
    LL_FLASH_SetLatency(LL_FLASH_LATENCY_1);

    /* Enable HSI and wait for activation*/
    LL_RCC_HSI_Enable();
    while (LL_RCC_HSI_IsReady() != 1);

    /* Main PLL configuration and activation */
    LL_RCC_PLL_ConfigDomain_SYS(LL_RCC_PLLSOURCE_HSI_DIV_2,
                                LL_RCC_PLL_MUL_12);

    LL_RCC_PLL_Enable();
    while (LL_RCC_PLL_IsReady() != 1);

    /* Sysclk activation on the main PLL */
    LL_RCC_SetAHBPrescaler(LL_RCC_SYSCLK_DIV_1);
    LL_RCC_SetSysClkSource(LL_RCC_SYS_CLKSOURCE_PLL);
    while (LL_RCC_GetSysClkSource() != LL_RCC_SYS_CLKSOURCE_STATUS_PLL);

    /* Set APB1 prescaler */
    LL_RCC_SetAPB1Prescaler(LL_RCC_APB1_DIV_1);

    /* Update CMSIS variable (which can be updated also
     * through SystemCoreClockUpdate function) */
    SystemCoreClock = 48000000;
}

/*
 * Clock on GPIOC and set two led pins
 */
static void gpio_config(void)
{
    LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOC);
    LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_9, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_8, LL_GPIO_MODE_OUTPUT);
    return;
}

/*
 * Set callback for out devic8
 */
static void printf_config(void)
{
    xdev_out(oled_putc);
    return;
}

/*
 * Init all periphs and print out something
 */
int main(void)
{   
    rcc_config();
    gpio_config();
    I2C_config();
    //oled_config();
    //LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_9);

    //printf_config();
    //LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_9);

    //oled_clr(0x00);
    //xprintf("Started oled\n");
    //oled_update();
    
    giro_config();
    //printf_config();
    
    //LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_9);
    //oled_clr(0x00);
    //xprintf("Started giro\n");
    //oled_update();
    //LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_9);

    /*
    while (1)
    {
        int16_t angle = giro_rot_read();
        xprintf("a: %d", angle);
        oled_update();
    }
    */

    while(1);

    return 0;
}
