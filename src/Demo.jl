# Вывод информации о массиве и вывод его содержимого
function print_array_info(array)
    println(summary(array), ": ", repr(array))
end

# Вывод суммы всех элементов массива
function print_sum_of_array_values(array)
    result = 0
    for value in array
        result += value
    end
    println(result)
end

# Инициализация массива из трёх элементов случайными числами
demo_array = [rand(0:255), rand(0:255), rand(0:255)]

# Действия с массивом
print_array_info(demo_array)
print_sum_of_array_values(demo_array)
