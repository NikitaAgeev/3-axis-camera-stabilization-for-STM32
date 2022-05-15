#include "main.h"
#include "stdlib.h"
#include "string.h"

#include "stm32f0xx_ll_rcc.h"
#include "stm32f0xx_ll_system.h"
#include "stm32f0xx_ll_bus.h"
#include "stm32f0xx_ll_gpio.h"
#include "stm32f0xx_ll_exti.h"
#include "stm32f0xx_ll_utils.h"
#include "stm32f0xx_ll_cortex.h"

#define MPU6050_ADDR 0xD0

#define SMPLRT_DIV_REG 0x19
#define GYRO_CONFIG_REG 0x1B
#define ACCEL_CONFIG_REG 0x1C
#define ACCEL_XOUT_H_REG 0x3B
#define TEMP_OUT_H_REG 0x41
#define GYRO_XOUT_H_REG 0x43
#define PWR_MGMT_1_REG 0x6B
#define WHO_AM_I_REG 0x75

int giro_config(I2C_HandleTypeDef hi2)
{
	uint8_t check, Data;

	HAL_I2C_Mem_Read (&hi2, MPU6050_ADDR, WHO_AM_I_REG,1, &check, 1, 1000);
		
	if (check == 0x68)
      {
            /////////
            Data = 0;
            HAL_I2C_Mem_Write(&hi2, MPU6050_ADDR, PWR_MGMT_1_REG, 1, &Data, 1, 1000);
            ////////
            Data = 0x07;
            HAL_I2C_Mem_Write(&hi2, MPU6050_ADDR, SMPLRT_DIV_REG, 1, &Data, 1, 1000);
            /////////
            Data = 0x00;
            HAL_I2C_Mem_Write(&hi2, MPU6050_ADDR, ACCEL_CONFIG_REG, 1, &Data, 1, 1000);
            ////////
            Data = 0x00;
            HAL_I2C_Mem_Write(&hi2, MPU6050_ADDR, GYRO_CONFIG_REG, 1, &Data, 1, 1000);
      }
}

int giro_read_angls(I2C_HandleTypeDef hi2, double* angle_x, double* angle_y, double* angle_z)
{
      uint8_t Rec_Data[6] = {0};
      
      HAL_I2C_Mem_Read(&hi2, MPU6050_ADDR, GYRO_XOUT_H_REG , 1, Rec_Data, 6, 1000);
      
      int16_t Gyro_X_RAW = (int16_t)(Rec_Data[0] << 8 | Rec_Data[1]);
      int16_t Gyro_Y_RAW = (int16_t)(Rec_Data[2] << 8 | Rec_Data[3]);
      int16_t Gyro_Z_RAW = (int16_t)(Rec_Data[4] << 8 | Rec_Data[5]);
      ////////
      *angle_x = Gyro_X_RAW*(250*3.1415/(63*180));
      *angle_y = Gyro_Y_RAW*(250*3.1415/(63*180));
      *angle_z = Gyro_Z_RAW*(250*3.1415/(63*180));
}
