#include "main.h"
#include "servo.h"
#include "stdlib.h"

#define MAX_COUNTER 20000-1
#define PRESKAIL 48
#define MIN_SIZE 500
#define MAX_SIZE 2250

int set_servo(TIM_HandleTypeDef* tim, uint8_t chanal, double angle)
{
    switch (chanal)
    {
    case 1:
        tim->Instance->CCR1 = MIN_SIZE + (MAX_SIZE - MIN_SIZE)*(angle/3.1415);
        break;
    case 2:
        tim->Instance->CCR2 = MIN_SIZE + (MAX_SIZE - MIN_SIZE)*(angle/3.1415);
        break;
    case 3:
        tim->Instance->CCR3 = MIN_SIZE + (MAX_SIZE - MIN_SIZE)*(angle/3.1415);
        break;
    case 4:
        tim->Instance->CCR4 = MIN_SIZE + (MAX_SIZE - MIN_SIZE)*(angle/3.1415);
        break;
    default:
        break;
    }
    return 0;
}

int set_3_servo(TIM_HandleTypeDef* tim, double angle_1, double angle_2, double angle_3)
{
    if(angle_1 < 0) angle_1 = 0;
    if(angle_1 > 3.1415) angle_1 = 3,1415;
    if(angle_2 < 0) angle_2 = 0;
    if(angle_2 > 3.1415) angle_2 = 3,1415;
    if(angle_3 < 0) angle_3 = 0;
    if(angle_3 > 3.1415) angle_3 = 3,1415;

    tim->Instance->CCR1 = (MIN_SIZE + (MAX_SIZE - MIN_SIZE)*(angle_1/3.1415));
    tim->Instance->CCR2 = (MIN_SIZE + (MAX_SIZE - MIN_SIZE)*(angle_2/3.1415));
    tim->Instance->CCR3 = (MIN_SIZE + (MAX_SIZE - MIN_SIZE)*(angle_3/3.1415));
    return 0;
}