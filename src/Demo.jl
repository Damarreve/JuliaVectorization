# Вывод информации о массиве и вывод его содержимого
function print_array_info(array::Array)
    println(summary(array), ": ", repr(array))
end

# Сумма всех элементов массива
function array_sum(array::Array)
    result = 0
    for value in array
        result += value
    end
    return result
end

# Произведение всех элементов массива
function array_multiplication(array::Array)
    result = 1
    for value in array
        result *= value
    end
    return result
end

# Инициализация массива из трёх элементов случайными числами
demo_array = [rand(0:255), rand(0:255), rand(0:255)]

# Действия с массивом
print_array_info(demo_array)
println("Сумма всех элементов: ", array_sum(demo_array))
println("Произведение всех элементов: ", array_multiplication(demo_array))
