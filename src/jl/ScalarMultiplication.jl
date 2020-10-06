function do_multiply(matrix::Array{Array{Float64,1},1}, vector::Array{Float64,1})::Array{Float64,1}
    for (c, _vector) in matrix
        _res = 0.0
        for i = 1:2
            _res += _vector[i] * vector[i]
        end
        println(_res)
    end
end

a_matrix = [[1.0, 2.0, 3.0], [4.0, 5.0, 6.0], [7.0, 8.0, 9.0]]
a_vector = [10.0, 11.0, 12.0]

do_multiply(a_matrix, a_vector)
