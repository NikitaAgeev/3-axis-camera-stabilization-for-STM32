#include "quaternion_lib.h"

//----------------------------QUATERNION-FUNCTIONS---------------------------------------

quaternion Quaternion_Add (quaternion a, quaternion b)
{
    quaternion result = {0};

    result.a = a.a + b.a;
    result.i = a.i + b.i;
    result.j = a.j + b.j;
    result.k = a.k + b.k;

    return result;
}

quaternion Quaternion_Sub (quaternion a, quaternion b)
{
    quaternion result = {0};
    
    result.a = a.a - b.a;
    result.i = a.i - b.i;
    result.j = a.j - b.j;
    result.k = a.k - b.k;

    return result;
}

quaternion Quaternion_Mul (quaternion a, quaternion b)
{ 
    quaternion result = {0};

    result.a = a.a * b.a - a.i * b.i - a.j * b.j - a.k * b.k;
    result.i = a.a * b.i + a.i * b.a + a.j * b.k - a.k * b.j;
    result.j = a.a * b.j - a.i * b.k + a.j * b.a + a.k * b.i;
    result.k = a.a * b.k + a.i * b.j - a.j * b.i + a.k * b.a;

    return result;
}

void Quaternion_Print (quaternion a)
{
    printf("q = %lf + %lf*i  + %lf*j  + %lf*k\n", a.a, a.i, a.j, a.k);
}

void Quaternion_Conjugate (quaternion* a)
{
    a->i = -a->i;
    a->j = -a->j;
    a->k = -a->k;
}

quaternion Quaternion_Inverse (quaternion a)
{
    Quaternion_Conjugate(&a);
    double norm = Quaternion_Norm(&a);
    a.a /= norm;
    a.i /= norm;
    a.j /= norm;
    a.k /= norm;
    return a;
}

double Quaternion_Norm (const quaternion* a)
{
    return a->a * a->a + a->i * a->i + a->j * a->j + a->k * a->k;
}
//---------------------------------------------------------------------------------------
//------------------------------VECTOR-FUNCTIONS-----------------------------------------
void Vector_Print (vector vec)
{
    printf("x = %lf, y = %lf, z = %lf\n", vec.x, vec.y, vec.z);
}

double Vector_Scalar_Mul (vector* a, vector* b)
{
    double result = a->x * b->x + a->y * b->y + a->z * b->z;
    return result;
}

vector Vector_Vector_Mul (vector* a, vector* b)
{
    vector result = {0};
    result.x = a->y * b->z - a->z * b->y;
    result.y = -(a->x * b->z - a->z * b->x);
    result.z = a->x * b->y - a->y * b->x;
    return result;
}

vector Vector_Number_Mul (vector* a, double num)
{
    vector result = {a->x * num, a->y * num, a->z * num};
    return result;
}

vector Vector_Multi_Sum (vector* a, vector* b, vector* c)
{
    vector result = {a->x + b->x + c->x, a->y + b->y + c->y, a->z + b->z + c->z};
    return result;
}


vector Rotate (vector vec, double phi, double psi, double theta)
{
    vector result = {0};    
    vector first_direction = {1, 0, 0};
    vector second_direction = {0, cos(phi), sin(phi)};
    vector third_direction = {sin(psi), cos(psi) * sin(phi), cos(psi) * cos(psi)};

    quaternion first_rotate = {cos(phi / 2), sin(phi / 2) * first_direction.x, sin(phi / 2) * first_direction.y, sin(phi / 2) * first_direction.z};
    quaternion second_rotate = {cos(psi / 2), sin(psi / 2) * second_direction.x, sin(psi / 2) * second_direction.y, sin(psi / 2) * second_direction.z};
    quaternion third_rotate = {cos(theta / 2), sin(theta / 2) * third_direction.x, sin(theta / 2) * third_direction.y, sin(theta / 2) * third_direction.z};

    quaternion rotate = Quaternion_Mul (third_rotate, second_rotate);
               rotate = Quaternion_Mul (rotate, first_rotate);
    
    result = RotateQuat (rotate, vec);
    return result;
}


vector RotateQuat (quaternion rotate, vector in)
{
    quaternion in_quaternion = {0, in.x, in.y, in.z};
    quaternion result = Quaternion_Mul (rotate, in_quaternion);
               result = Quaternion_Mul (result, Quaternion_Inverse(rotate));
    vector out = {result.i, result.j, result.k};
    return out;
}
