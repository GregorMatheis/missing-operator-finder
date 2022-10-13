#bruteforce solution
module operator_finder

function string_splitter(s::String)::AbstractArray
    try
        s_array = parse.(Float64, split(s, " "))
        return s_array
    catch er
        if isa(er ,ArgumentError)
            @error "Values in string can't be parsed into numbers. Make sure that string is formated as numbers with space no other charactes. E.G. \"1 2 3 4 10\""
        end
        return []
    end
end

function solver(input::AbstractArray)::String
    result = input[end]
    input = input[1:end-1]
    positions = length(input)-1
    operator_combinations = collect(Iterators.product(repeat([[" + " , " - " , " * " , " / "]], positions)...))
    i = 1
    for oc in operator_combinations
        formular = join([string(input[i]) * string(x) for (i, x) in enumerate(oc)]) * string(input[end])
        eval(Meta.parse(formular)) == result && return formular * " = $result"
        i += 1
    end
    return "No solution"
end

solver(input::AbstractString) = solver(string_splitter(input))

end