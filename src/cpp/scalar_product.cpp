#include <stdio.h>
#include <iostream>
#include <chrono>

double scalar_product(double* _vector1, double* _vector2, int dimension)
{
    double result = 0;
#pragma omp parallel for num_threads(4)
    for (int i = 0; i < dimension; i++) result += _vector1[i] * _vector2[i];
    return result;
}

double* v_multiply(double** _matrix, double* _vector, int dimension)
{
    double* result = new double[dimension];
#pragma omp parallel for num_threads(4)
    for (int i = 0; i < dimension; i++) result[i] = scalar_product(_matrix[i], _vector, dimension);
    return result;
}

double* multiply(double** _matrix, double* _vector, int dimension)
{
    double* result = new double[dimension];
#pragma omp parallel for num_threads(4)
    for (int i = 0; i < dimension; i++)
    {
        result[i] = 0;
#pragma omp parallel for num_threads(4)
        for (int j = 0; j < dimension; j++) result[i] += _matrix[i][j] * _vector[j];
    }
    return result;
}

double get_random_double()
{
    double random_digit = rand() % 2 == 0 ? 1 : -1;
    random_digit *= (rand() + 1) * (rand() + 1) / (rand() + 255);
    return random_digit;
}

int main(int argc, char* argv[], char *envp[])
{
    if (argc < 3)
    {
	printf("First argument must be a digit (it is a dimension), second argument must be 0 or 1 (1 - use vectorization, 0 - do not use)\n");
	return 1;
    }
    int size = atoi(argv[1]);
    bool use_vectorization = atoi(argv[2]) == 1;
    bool print_time = argv[3] != NULL;
    printf("Dimension is %d (it will use ~%dkb of RAM)\n", size, (size * (2 + size) * sizeof(double)) / 1000);
    auto start(std::chrono::high_resolution_clock::now());
    double* a_vector = new double[size];
    double** a_matrix = new double*[size];
    for (int i = 0; i < size; i++)
    {
        a_vector[i] = get_random_double();
        a_matrix[i] = new double[size];
        for (int j = 0; j < size; j++) a_matrix[i][j] = get_random_double();
    }
    auto end(std::chrono::high_resolution_clock::now());
    auto duration(std::chrono::duration_cast<std::chrono::microseconds>(end - start));
    printf("Random matrix and vector created for %dms\n", duration.count() / 1000);
    if (use_vectorization)
    {
        start = std::chrono::high_resolution_clock::now();
        v_multiply(a_matrix, a_vector, size);
        end = std::chrono::high_resolution_clock::now();
    }
    else
    {
        start = std::chrono::high_resolution_clock::now();
        multiply(a_matrix, a_vector, size);
        end = std::chrono::high_resolution_clock::now();
    }
    duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    printf("Duration of %sscalar multiplication: %dus (%dms)\n", use_vectorization ? "vectorized " : "", duration.count(), duration.count() / 1000);
    for (int i = 0; i < size; i++) delete a_matrix[i];
    delete a_matrix;
    delete a_vector;
    if (print_time) printf("%d\n", duration.count() / 1000);
    return 0;
}
