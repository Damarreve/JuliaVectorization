using Dates

function sum(vector1, vector2)
  result = 0.0
  for i = 1:length(vector1)
    result += vector1[i] * vector2[i]
  end
  return result
end

function multiply(matrix, vector)
  result = Array{Float64,1}(undef, 0)
  for i = 1:length(vector)
    row = matrix[i, :]
    result = [result; sum(row, vector)]
  end
  return result
end

size = 20000
ratio = 100
debug = false

println("Dimension is ", size)
t_start = now()
vector = rand(size) * ratio
matrix = rand(size, size) * ratio
t_end = now()
println("Random matrix and vector created for ", t_end - t_start)

t_start = now()
result = multiply(matrix, vector)
t_end = now()

if debug
  display(matrix)
  println()
  display(vector)
  println()
  display(result)
  println()
end

println("Scalar multiplication of matrix by vector took ", t_end - t_start)
