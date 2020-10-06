using Dates

function create_array(length::Int64, min_value::Float64, max_value::Float64)::Array{Float64,1}
    array = []
    for i = 1:length
        push!(array, rand(min_value:.0001:max_value))
    end
    return array
end

function multiply_array(array::Array{Float64,1})
    result = 1
    for value in array
        result *= value
    end
    return result
end

demo_array = create_array(1000, 0.0, 2.0)
println(summary(demo_array))
time = now()
println(multiply_array(demo_array))
println("Multiply cost ", now() - time)
