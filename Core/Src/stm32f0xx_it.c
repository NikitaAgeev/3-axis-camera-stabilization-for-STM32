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

extern I2C_HandleTypeDef hi2c1;

extern TIM_HandleTypeDef htim1;
extern TIM_HandleTypeDef htim2;

extern int8_t button_status ;

extern uint64_t button_delay_counter ;

extern uint16_t number ;

extern const uint64_t sis_tik_frik;

extern UART_HandleTypeDef huart1;

vector front = {1, 0, 0};
vector app = {0, 1, 0};
vector oz = {0, 0, 1};


u_int8_t mode = 1;

#define LOCK_MODE 1
#define UNLOCK_MODE 1 << 1

#define BUTTON_DELAY 1

#define BUTTON_PUSH 1

#define BUTTON_PUSHED 1 << 1

#define BUTTON_UNPUSHED 1 << 2

typedef struct {
    uint8_t cmd;
    uint8_t params[10];
    uint8_t active;
} uart_req_t;
static uart_req_t uart_req;

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

   u_int8_t* a = "yes\n";
   /*
  while (!LL_USART_IsActiveFlag_TXE(USART1));
    LL_USART_TransmitData8(USART1, '1');
    */
  /* USER CODE BEGIN SysTick_IRQn 0 */
	if((button_status & BUTTON_PUSH) && (button_delay_counter < BUTTON_DELAY))
    {
        button_delay_counter++;
    }
	else if(button_status & BUTTON_PUSH)
	{
		if(!LL_GPIO_IsInputPinSet(GPIOA, LL_GPIO_PIN_3))
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
			}
		}
	}

  #define POPRAVKA 0.005

    

  if(mode == LOCK_MODE)
  { 
    double psi = 0;
    double phi = 0;
    double teta = 0;

    psi = 0;
    phi = 0;
    teta = 0;

    giro_read_angls(&hi2c1, &psi, &phi, &teta);
    squeaker_set_frik(&htim1, 4, 9000);

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
    
    servo_rick = atan(front.y / front.x);
    servo_tang = -asin(front.z);
    
    
    vector r0 = Vector_Vector_Mul(&front, &oz);
    
    servo_kren = asin(Vector_Scalar_Mul(&app, &r0)/sqrt(Vector_Scalar_Mul(&r0, &r0)));
    

    set_3_servo(&htim2, servo_rick + 3.14/2 , servo_tang + 3.14/2 , servo_kren + 3.14/2);

    if(servo_tang > 0)
		{
			pin_mask = pin_mask | LL_GPIO_PIN_8;
		}
		else if (servo_tang < 0)
		{
			pin_mask = pin_mask | LL_GPIO_PIN_9;
		}
    LL_GPIO_WriteOutputPort(GPIOC, pin_mask);
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
  * @brief This function handles EXTI line 2 and 3 interrupts.
  */
void EXTI2_3_IRQHandler(void)
{
  /* USER CODE BEGIN EXTI2_3_IRQn 0 */
  if(!(button_status & BUTTON_PUSH))
    {
        button_status = BUTTON_PUSH;
    } 
  /* USER CODE END EXTI2_3_IRQn 0 */
  HAL_GPIO_EXTI_IRQHandler(GPIO_PIN_3);
  /* USER CODE BEGIN EXTI2_3_IRQn 1 */

  /* USER CODE END EXTI2_3_IRQn 1 */
}

/**
  * @brief This function handles USART1 global interrupt / USART1 wake-up interrupt through EXTI line 25.
  */
void USART1_IRQHandler(void)
{
  /* USER CODE BEGIN USART1_IRQn 0 */
  while (!LL_USART_IsActiveFlag_TXE(USART1));
  LL_USART_TransmitData8(USART1, '1');
  /* USER CODE END USART1_IRQn 0 */
  HAL_UART_IRQHandler(&huart1);
  /* USER CODE BEGIN USART1_IRQn 1 */
  /* USER CODE END USART1_IRQn 1 */
}

/* USER CODE BEGIN 1 */

/* USER CODE END 1 */
