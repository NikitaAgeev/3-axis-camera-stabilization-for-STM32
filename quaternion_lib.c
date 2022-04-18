
#include "quaternion_lib.h"

d_quaternion quaternion_criate (double a, double i, double j, double k)
{
    d_quaternion c = {a, i, j, k};
    return c;    
}

d_quaternion quaternion_add(d_quaternion a, d_quaternion b)
{
    d_quaternion c = {0};
    
    c.a = a.a + b.a;
    c.i = a.i + b.i;
    c.j = a.j + b.j;
    c.k = a.k + b.k;

    return c;
}

d_quaternion quaternion_sub(d_quaternion a, d_quaternion b)
{
    d_quaternion c = {0};
    
    c.a = a.a - b.a;
    c.i = a.i - b.i;
    c.j = a.j - b.j;
    c.k = a.k - b.k;

    return c;
}

d_quaternion quaternion_mul(d_quaternion a, d_quaternion b)
{
    d_quaternion c = {0};
    
    c.a = a.a*b.a + a.i*b.i + a.j*b.j + a.k*b.k;
    c.i = a.a*b.i + a.i*b.a + a.j*b.k - a.k*b.j;
    c.j = a.a*b.j + a.j*b.a + a.k*b.i - a.i*b.k;
    c.k = a.a*b.k + a.k*b.a + a.i*b.j - a.j*b.i;

    return c;
}

void quaternion_print(d_quaternion a)
{
    printf("q = %lf + %lf*i  + %lf*j  + %lf*k\n", a.a, a.i, a.j, a.k);
}

