/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    stm32f0xx_it.c
  * @brief   Interrupt Service Routines.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2022 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "stm32f0xx_it.h"
/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "servo.h"
#include "squeaker.h"
#include "stdlib.h"
#include "quaternion_lib.h"
#include "giro_driver.h"

#include "stm32f0xx_ll_rcc.h"
#include "stm32f0xx_ll_system.h"
#include "stm32f0xx_ll_bus.h"
#include "stm32f0xx_ll_gpio.h"
#include "stm32f0xx_ll_exti.h"
#include "stm32f0xx_ll_utils.h"
#include "stm32f0xx_ll_cortex.h"
#include "stm32f0xx_ll_usart.h"


#include "oled_driver.h"
#include "xprintf.h"


extern I2C_HandleTypeDef hi2c1;

extern TIM_HandleTypeDef htim1;
extern TIM_HandleTypeDef htim2;

extern int8_t button_status ;

extern uint64_t button_delay_counter ;

extern uint16_t number ;

extern const uint64_t sis_tik_frik;

extern UART_HandleTypeDef huart1;

vector front = {1, 0, 0};
vector app = {0, 0, 1};
vector oz = {0, 0, 1};


u_int8_t mode = 1;

#define LOCK_MODE 1
#define UNLOCK_MODE 1 << 1

#define BUTTON_DELAY 1

#define BUTTON_PUSH 1

#define BUTTON_PUSHED 1 << 1

#define BUTTON_UNPUSHED 1 << 2

#define PI 3.1415

#define POPRAVKA 0.005

u_int8_t squick_status = 0;

#define ON_SQUICK 1
#define OFF_SQUICK 0 


/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN TD */

/* USER CODE END TD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/* External variables --------------------------------------------------------*/
extern UART_HandleTypeDef huart1;
/* USER CODE BEGIN EV */

/* USER CODE END EV */

/******************************************************************************/
/*           Cortex-M0 Processor Interruption and Exception Handlers          */
/******************************************************************************/
/**
  * @brief This function handles Non maskable interrupt.
  */
void NMI_Handler(void)
{
  /* USER CODE BEGIN NonMaskableInt_IRQn 0 */

  /* USER CODE END NonMaskableInt_IRQn 0 */
  /* USER CODE BEGIN NonMaskableInt_IRQn 1 */
  while (1)
  {
  }
  /* USER CODE END NonMaskableInt_IRQn 1 */
}

/**
  * @brief This function handles Hard fault interrupt.
  */
void HardFault_Handler(void)
{
  /* USER CODE BEGIN HardFault_IRQn 0 */

  /* USER CODE END HardFault_IRQn 0 */
  while (1)
  {
    /* USER CODE BEGIN W1_HardFault_IRQn 0 */
    /* USER CODE END W1_HardFault_IRQn 0 */
  }
}

/**
  * @brief This function handles System service call via SWI instruction.
  */
void SVC_Handler(void)
{
  /* USER CODE BEGIN SVC_IRQn 0 */

  /* USER CODE END SVC_IRQn 0 */
  /* USER CODE BEGIN SVC_IRQn 1 */

  /* USER CODE END SVC_IRQn 1 */
}

/**
  * @brief This function handles Pendable request for system service.
  */
void PendSV_Handler(void)
{
  /* USER CODE BEGIN PendSV_IRQn 0 */

  /* USER CODE END PendSV_IRQn 0 */
  /* USER CODE BEGIN PendSV_IRQn 1 */

  /* USER CODE END PendSV_IRQn 1 */
}

/**
  * @brief This function handles System tick timer.
  */
void SysTick_Handler(void)
{
  /* USER CODE BEGIN SysTick_IRQn 0 */
	if((button_status & BUTTON_PUSH) && (button_delay_counter < BUTTON_DELAY))
    {
        button_delay_counter++;
    }
	else if(button_status & BUTTON_PUSH)
	{
		if(HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_4) == GPIO_PIN_RESET )
		{
			if(!(button_status & BUTTON_PUSHED))
			{
        if(mode == LOCK_MODE)
        {
          mode = UNLOCK_MODE;
        }
        else
        {
          mode = LOCK_MODE;
        }
				button_status = button_status | BUTTON_PUSHED;
			}
		}
		else
		{
			if(!(button_status & BUTTON_UNPUSHED))
			{
				//здесь пока тоже пусто)
				button_status = button_status & (~(BUTTON_PUSH | BUTTON_PUSHED));
				button_status = button_status | BUTTON_UNPUSHED;
        //button_delay_counter = 0;
			}
		}
	}

  if(mode == LOCK_MODE)
  { 
    double psi = 0;
    double phi = 0;
    double teta = 0;

    static double last_counted_tang = 0;

    squick_status = OFF_SQUICK;

    psi = 0;
    phi = 0;
    teta = 0;

    giro_read_angls(&hi2c1, &psi, &phi, &teta);
    

    uint16_t pin_mask = LL_GPIO_ReadOutputPort(GPIOC);
		
		pin_mask = pin_mask & (~(LL_GPIO_PIN_8 | LL_GPIO_PIN_9));

    double servo_rick = 0;
    double servo_tang = 0;
    double servo_kren = 0;

    psi = psi*POPRAVKA;
    teta = -teta*POPRAVKA;  
    phi = phi*POPRAVKA;

    front = Rotate(front, psi, teta, phi);
    app = Rotate(app, psi, teta, phi);
    
    /* Рассчёт рысканья*/
    if(front.x > 0)
    { 
      servo_rick = atan(front.y / front.x);
    }
    else if (front.y > 0)
    { 
      squick_status = ON_SQUICK;
      servo_rick = PI/2;
    }
    else 
    { 
      squick_status = ON_SQUICK;
      servo_rick = -PI/2;
    }

    /* Рассчёт тангажа*/
    if(front.x > 0)
    {
      servo_tang = -asin(front.z);
      last_counted_tang = servo_tang; 
    }
    else
    { 
      squick_status = ON_SQUICK;
      servo_tang = last_counted_tang;
    }

    /*рассчёт крена*/  
    if(app.z > 0)
    {
      vector r0 = Vector_Vector_Mul(&front, &oz);
      
      servo_kren = asin(Vector_Scalar_Mul(&app, &r0)/sqrt(Vector_Scalar_Mul(&r0, &r0)));  
    }
    else if(app.y > 0)
    {
      squick_status = ON_SQUICK;
      servo_kren = -PI/2;
    }
    else 
    {
      squick_status = ON_SQUICK;
      servo_kren = PI/2;
    }

    set_3_servo(&htim2, servo_rick + PI/2 , servo_tang + PI/2 , servo_kren + PI/2);

    if (squick_status == ON_SQUICK)
    {
      squeaker_set_frik(&htim1, 4, 900);
    }
    else
    {
      off_squeaker(&htim1, 4);
    }
    /*
    xprintf("\n     Hello, world!\n\n");
    xprintf("    This is an OLED\n");
    xprintf("   display based on\n");
    xprintf("    SSD1306 driver");
    oled_update();
    */
  }
  else
  {
    off_squeaker(&htim1, 4);
  }
  
  /* USER CODE END SysTick_IRQn 0 */
  HAL_IncTick();
  /* USER CODE BEGIN SysTick_IRQn 1 */


  /* USER CODE END SysTick_IRQn 1 */
}

/******************************************************************************/
/* STM32F0xx Peripheral Interrupt Handlers                                    */
/* Add here the Interrupt Handlers for the used peripherals.                  */
/* For the available peripheral interrupt handler names,                      */
/* please refer to the startup file (startup_stm32f0xx.s).                    */
/******************************************************************************/

/**
  * @brief This function handles EXTI line 4 to 15 interrupts.
  */
void EXTI4_15_IRQHandler(void)
{
  /* USER CODE BEGIN EXTI4_15_IRQn 0 */
  if(!(button_status & BUTTON_PUSH))
  {
    button_status = BUTTON_PUSH;
    button_delay_counter = 0;
  }
  /* USER CODE END EXTI4_15_IRQn 0 */
  HAL_GPIO_EXTI_IRQHandler(GPIO_PIN_4);
  /* USER CODE BEGIN EXTI4_15_IRQn 1 */

  /* USER CODE END EXTI4_15_IRQn 1 */
}

/**
  * @brief This function handles USART1 global interrupt / USART1 wake-up interrupt through EXTI line 25.
  */
void USART1_IRQHandler(void)
{
  /* USER CODE BEGIN USART1_IRQn 0 */
  /*while (!LL_USART_IsActiveFlag_TXE(USART1));
  LL_USART_TransmitData8(USART1, '1');
  /* USER CODE END USART1_IRQn 0 */
  HAL_UART_IRQHandler(&huart1);
  /* USER CODE BEGIN USART1_IRQn 1 */
  /* USER CODE END USART1_IRQn 1 */
}

/* USER CODE BEGIN 1 */

/* USER CODE END 1 */
