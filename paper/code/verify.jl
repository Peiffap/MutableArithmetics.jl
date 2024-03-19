module Verify
using MutableArithmetics
struct SymbolicVariable end
for file in readdir(@__DIR__)
    path = joinpath(@__DIR__, file)
    if path != (@__FILE__) && file != "mul.jl"
        include(file)
    end
end
end
