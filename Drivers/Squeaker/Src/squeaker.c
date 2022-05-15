#include "main.h"
#include "squeaker.h"
#include "stdlib.h"


int squeaker_set_frik(TIM_HandleTypeDef* tim, uint8_t chanal, double frik)
{
    tim->Instance->ARR = 1000000/frik;

    if(tim->Instance->CNT >= tim->Instance->ARR)
    {
        tim->Instance->CNT = 0;
    }

    switch (chanal)
    {
    case 1:
        tim->Instance->CCR1 = 1000000/(2*frik);
        break;
    case 2:
        tim->Instance->CCR2 = 1000000/(2*frik);
        break;
    case 3:
        tim->Instance->CCR3 = 1000000/(2*frik);
        break;
    case 4:
        tim->Instance->CCR4 = 1000000/(2*frik);
        break;
    default:
        break;
    }

    return 0;
}

int off_squeaker(TIM_HandleTypeDef* tim, uint8_t chanal)
{
    switch (chanal)
    {
    case 1:
        tim->Instance->CCR1 = 0;
        break;
    case 2:
        tim->Instance->CCR2 = 0;
        break;
    case 3:
        tim->Instance->CCR3 = 0;
        break;
    case 4:
        tim->Instance->CCR4 = 0;
        break;
    default:
        break;
    }

    return 0;
}