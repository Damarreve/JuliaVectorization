using Dates

size = 5000
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

_start = now()
result = matrix * vector
_end = now()

if debug
  display(result)
  println()
end

println("Vectorized scalar multiplication took ", _end - _start)
