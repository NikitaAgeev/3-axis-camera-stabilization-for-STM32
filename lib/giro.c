#include "stm32f0xx_ll_bus.h"
#include "stm32f0xx_ll_gpio.h"
#include "stm32f0xx_ll_rcc.h"
#include "stm32f0xx_ll_system.h"
#include "stm32f0xx_ll_i2c.h"

#include <stdlib.h>
#include "oled_driver.h"



#define I2C_REQUEST_WRITE                       0x00
#define I2C_REQUEST_READ                        0x01
#define SLAVE_OWN_ADDRESS                       0x68

#define DEPUK_1 LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_9);
#define DEPUK_2 LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_8);


static uint8_t giro_send_reg(uint8_t reg_adr, uint8_t bite)
{

//--Ralisation--------------------


    LL_I2C_HandleTransfer(I2C1, SLAVE_OWN_ADDRESS, LL_I2C_ADDRSLAVE_7BIT,
                          1, LL_I2C_MODE_AUTOEND,
                          LL_I2C_GENERATE_START_WRITE);

    //проверка отправки адреса


    while(!LL_I2C_IsActiveFlag_TXE(I2C1)){};

    LL_I2C_TransmitData8(I2C1, reg_adr);

    DEPUK_1
    
    while(!LL_I2C_IsActiveFlag_TXE(I2C1)){};

    DEPUK_2

    LL_I2C_TransmitData8(I2C1, (uint8_t)(bite));
    
    while(!LL_I2C_IsActiveFlag_TXE(I2C1)){};
    

    //проверка конца трансляции
    //while (LL_I2C_IsActiveFlag_TC(I2C1)){;}

    return 0;
}

void giro_config(void)
{
    giro_send_reg(0x6B, 0x80);
    
    giro_send_reg(0x6B, 0x01);
    giro_send_reg(0x19, 7);
    
    giro_send_reg(0x1B, 0);
    giro_send_reg(0x1C, 0);
    return;
}

int16_t giro_rot_read(void)
{
    uint16_t out_angle = 0;

    LL_I2C_HandleTransfer(I2C1, 0xD0, LL_I2C_ADDRSLAVE_7BIT,
                          1, LL_I2C_MODE_AUTOEND,
                          LL_I2C_GENERATE_START_WRITE);
    /*
     * Send Control byte (Co = 0, D/C# = 1)
     */
    while (!LL_I2C_IsActiveFlag_TXIS(I2C1));
    LL_I2C_TransmitData8(I2C1, 0x41);

    while (LL_I2C_IsActiveFlag_TC(I2C1));
    
    LL_I2C_HandleTransfer(I2C1, 0xD0, LL_I2C_ADDRSLAVE_7BIT,
                          2, LL_I2C_MODE_AUTOEND,
                          LL_I2C_GENERATE_START_READ);

    while (!LL_I2C_IsActiveFlag_TXIS(I2C1));
    out_angle += (LL_I2C_ReceiveData8(I2C1) << 8);

    while (!LL_I2C_IsActiveFlag_TXIS(I2C1));
    out_angle += (LL_I2C_ReceiveData8(I2C1));

    /*
     * Check for end of transmission
     */
    while (LL_I2C_IsActiveFlag_TC(I2C1));
    
    return out_angle;    
}

