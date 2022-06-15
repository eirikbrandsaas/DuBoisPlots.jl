using DuBoisPlots
using Test

using DataFrames
using CSV

@testset "Plate 7" begin
    df = DataFrame(Year=[1980,1990],Black=[0.5,0.6],White=[0.2,0.3])
    p = Plate7(df, :Year)
        # @test typeof(p)==Figure
end

@testset "Plate 51" begin
    df = CSV.read("data/original/Plate51.csv",DataFrame)
    Plate51(df, :Year, title = uppercase("Proportion of freemen and slaves among american negroes . "),
        small_title = uppercase("     proportion des nègres libres et des esclaves en amérique . "),
        subtitle = uppercase("done by atlanta university . "), lab_1_name = "SLAVES \nESCLAVES", lab_2_name = "FREE — LIBRE",
        lab_1_pos = Point.(1830, 60), lab_2_pos = Point.(1830, 95))

end
