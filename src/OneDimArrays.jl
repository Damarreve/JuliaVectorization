# Функции
addition(x, y) = x + y
division(x, y) = x / y
subtraction(x, y) = x - y
multiplication(x, y) = x * y

# ---------------------------------------------------
# Пример векторизации обычных математических операций
# ---------------------------------------------------

# Сами массивы
two_pow = [1, 2, 4, 8, 16]
three_pow = [1, 3, 9, 27, 81]

println("Первый массив (", summary(two_pow), "): ", repr(two_pow))
println("Второй массив (", summary(three_pow), "): ", repr(three_pow))
println("Поэлементные операции с массивами: ")
println("1. Сложение - ", addition.(two_pow, three_pow))
println("2. Вычитание - ", subtraction.(two_pow, three_pow))
println("3. Умножение - ", multiplication.(two_pow, three_pow))
println("4. Деление - ", division.(two_pow, three_pow))
