
#include "quaternion_lib.h"

void Quaternion_Ctor (quaternion_t* const quaternion, double a, double i, double j, double k)
{
    quaternion->a = a;
    quaternion->i = i;
    quaternion->j = j;
    quaternion->k = k;
}

quaternion_t* Quaternion_Add (const quaternion_t* a, const quaternion_t* b)
{
    quaternion_t* result = (quaternion_t*) calloc (sizeof(quaternion_t), 1);
    
    result->a = a->a + b->a;
    result->i = a->i + b->i;
    result->j = a->j + b->j;
    result->k = a->k + b->k;

    return result;
}

quaternion_t* Quaternion_Sub(const quaternion_t* a, const quaternion_t* b)
{
    quaternion_t* result = (quaternion_t*) calloc (sizeof(quaternion_t), 1);
    
    result->a = a->a - b->a;
    result->i = a->i - b->i;
    result->j = a->j - b->j;
    result->k = a->k - b->k;

    return result;
}

quaternion_t* Quaternion_Mul(const quaternion_t* a, const quaternion_t* b)
{
    quaternion_t* result = (quaternion_t*) calloc (sizeof(quaternion_t), 1);
    
    result->a = a->a * b->a + a->i * b->i + a->j * b->j + a->k * b->k;
    result->i = a->a * b->i + a->i * b->a + a->j * b->k - a->k * b->j;
    result->j = a->a * b->j + a->j * b->a + a->k * b->i - a->i * b->k;
    result->k = a->a * b->k + a->k * b->a + a->i * b->j - a->j * b->i;

    return result;
}

void Quaternion_Rrint(const quaternion_t* a)
{
    printf("q = %lf + %lf*i  + %lf*j  + %lf*k\n", a->a, a->i, a->j, a->k);
}

