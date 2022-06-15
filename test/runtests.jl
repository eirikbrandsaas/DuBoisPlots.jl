using DuBoisPlots
using Test

using DataFrames

@testset "Plate 7" begin
    df = DataFrame(Year=[1980,1990],Black=[0.5,0.6],White=[0.2,0.3])
    p = Plate7(df, :Year)
        # @test typeof(p)==Figure
end
