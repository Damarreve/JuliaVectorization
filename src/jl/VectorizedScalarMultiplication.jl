using Dates
using Distributed

function multiply(_vector1, _vector2)
  result = 0.0
  @sync @distributed for i = 1:length(_vector1)
    result += _vector1[i] * _vector2[i] 
  end
  return result
end

function vect_scalar_product(_matrix, _vector)
  result = zeros(length(_vector))
  @distributed for i = 1:length(result)
    result[i] = multiply(_matrix[i, :], _vector)
  end
  return result
end

size = 25000
ratio = 100
debug = false
println("Dimension is ", size)

_start = now()
result = zeros(size)
vector = rand(size) * ratio
matrix = rand(size, size) * ratio
_end = now()
println("Random matrix and vector created for ", _end - _start)

if debug
  display(vector)
  println()
  display(matrix)
  println()
  println("-----------------")
end

t_start = now()
@time result = matrix * vector
t_end = now()
println("Standart scalar multiplication took ", t_end - t_start)

if debug
  display(result)
  println()
end

t_start = now()
@time result = vect_scalar_product(matrix, vector)
t_end = now()
println("Vectorized scalar multiplication took ", t_end - t_start)

if debug
  display(result)
  println()
end

