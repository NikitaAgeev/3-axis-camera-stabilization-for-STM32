#include "quaternion_lib.h"

int main()
{
    vector vec = {1, 0, 0};
    vector res = Rotate(vec, DEG(90), DEG(90), DEG(90));
    Vector_Print (res);
    return 0;
}