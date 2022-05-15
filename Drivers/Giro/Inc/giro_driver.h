
int giro_config(I2C_HandleTypeDef* hi2);

int giro_read_angls(I2C_HandleTypeDef* hi2, double* angle_x, double* angle_y, double* angle_z);