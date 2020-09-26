function create_array(length::Int64, min_value::Float64, max_value::Float64)::Array{Float64,1}
    array = []
    for i = 1:length
        push!(array, rand(min_value:max_value))
    end
    return array
end

demo_array = create_array(10, 0.0, 30.0)
println(repr(demo_array))
println(summary(demo_array))
