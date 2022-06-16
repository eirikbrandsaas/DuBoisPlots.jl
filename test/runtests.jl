using DuBoisPlots
using Test

using DataFrames
using CSV

@testset "Plate 7" begin
    # Simple test
    df = DataFrame(t=[1,2],x1=[25,35],x2=[75,65])
    p = Plate7(df, :t)

end

@testset "Plate 25" begin
    # Simple Test
    data = DataFrame(Year = sort(rand(6)), Value = rand(6))
    j = Plate25(data, :Year, :Value, "Title")

    # Testing with data
    df = CSV.read(joinpath(@__DIR__,"../data/Plate25.csv"),DataFrame)
    k = Plate25(df, :Year, :Value, "Title")
end

@testset "Plate 51" begin
    # Simple test
    df = DataFrame(t=[1,2],x1=[25,35],x2=[75,65])
    Plate51(df,:t)

    # Testing optional arguments
    df = CSV.read("../data/original/Plate51.csv",DataFrame)
    Plate51(df, :Year, title = uppercase("Proportion of freemen and slaves among american negroes . "),
        small_title = uppercase("     proportion des nègres libres et des esclaves en amérique . "),
        subtitle = uppercase("done by atlanta university . "), lab_1_name = "SLAVES \nESCLAVES", lab_2_name = "FREE — LIBRE",
        lab_1_pos = (1830, 60), lab_2_pos = (1830, 95))

end
