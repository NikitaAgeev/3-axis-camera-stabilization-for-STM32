#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#ifndef QUTERNION
#define QUTERNION

typedef struct _quaternion_t
{
    double a;
    double i;
    double j;
    double k;
} quaternion_t;

void Quaternion_Ctor (quaternion_t * quaterion, double a, double i, double j, double k);

quaternion_t* Quaternion_Add (const quaternion_t* a, const quaternion_t* b);

quaternion_t* Quaternion_Sub (const quaternion_t* a, const quaternion_t* b);

quaternion_t* Quaternion_Mul (const quaternion_t* a, const quaternion_t* b);

void Quaternion_Print(const quaternion_t* quadr_for_print);

#endif