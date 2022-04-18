#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#ifndef QUTERNION

typedef struct
{
    double a;
    double i;
    double j;
    double k;
} d_quaternion;

#define QUTERNION

#endif

d_quaternion quaternion_criate (double a, double i, double j, double k);

d_quaternion quaternion_add (d_quaternion a, d_quaternion b);

d_quaternion quaternion_sub (d_quaternion a, d_quaternion b);

d_quaternion quaternion_mul (d_quaternion a, d_quaternion b);


void quaternion_print(d_quaternion quadr_for_print);