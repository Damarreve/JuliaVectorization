#include <stdio.h>
#include <iostream>
#include <chrono>

double* multiply(double** _matrix, double* _vector, int dimension)
{
    double* result = new double[dimension];
    for (int i = 0; i < dimension; i++)
    {
        result[i] = 0;
        for (int j = 0; j < dimension; j++) result[i] += _matrix[i][j] * _vector[j];
    }
    return result;
}

int main()
{
    const int size = 10000;
    double* a_vector = new double[size];
    double** a_matrix = new double*[size];
    for (int i = 0; i < size; i++)
    {
        a_vector[i] = i + 1 / size * (rand() % 255 + 1);
        a_matrix[i] = new double[size];
        for (int j = 0; j < size; j++) a_matrix[i][j] = (j + i + 1) * 3 / size * (rand() % 255 + 1);
    }
    auto start(std::chrono::high_resolution_clock::now());
    multiply(a_matrix, a_vector, size);
    auto end(std::chrono::high_resolution_clock::now());
    auto duration(std::chrono::duration_cast<std::chrono::microseconds>(end - start));
    printf("Scalar multiplication duration (dimension is %d): %dus\n", size, duration.count());
    return 0;
}
