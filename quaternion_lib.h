#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#ifndef QUTERNION
#define QUTERNION

#define PI 3.14159265
#define DEG(RAD) (PI * RAD / 180)

typedef struct _quaternion
{
    double a;
    double i;
    double j;
    double k;
} quaternion;

typedef struct _vector
{
    double x;
    double y;
    double z;
} vector;

//----------------------------QUATERNION-FUNCTIONS---------------------------------------
quaternion Quaternion_Add (quaternion a, quaternion b);

quaternion Quaternion_Sub (quaternion a, quaternion b);

quaternion Quaternion_Mul (quaternion a, quaternion b);

void Quaternion_Print (quaternion a);

void Quaternion_Conjugate (quaternion* a);

double Quaternion_Norm (const quaternion* a);

quaternion Quaternion_Inverse (quaternion a);
//---------------------------------------------------------------------------------------
//------------------------------VECTOR-FUNCTIONS-----------------------------------------
void Vector_Print(vector vec);

vector Vector_Vector_Mul (vector* a, vector* b);

double Vector_Scalar_Mul (vector* a, vector* b);

vector Vector_Number_Mul (vector* a, double num);

vector Vector_Multi_Sum (vector* a, vector* b, vector* c);

vector Rotate(vector vector, double phi, double psi, double theta);

vector RotateQuat (quaternion rotate, vector in);

#endif