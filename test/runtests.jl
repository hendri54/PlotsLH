using PlotsLH
using Plots, Test

include("test_setup.jl")

@testset "All" begin
    include("xy_test.jl")
    include("xyz_test.jl")
end

# ----------------