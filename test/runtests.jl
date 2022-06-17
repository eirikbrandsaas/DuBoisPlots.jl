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
    df = CSV.read(joinpath(@__DIR__,"../data/original/Plate25.csv"),DataFrame)
    k = Plate25(df, :Year, :Value, "Title")
end

@testset "Plate 51" begin
    # Simple test
    df = DataFrame(t=[1,2],x1=[25,35],x2=[75,65])
    d = Plate51(df,:t)

    # Testing optional arguments
    df = CSV.read("../data/original/Plate51.csv",DataFrame)
    e = Plate51(df, :Year, title = uppercase("Proportion of freemen and slaves among american negroes . "),
        small_title = uppercase("     proportion des nègres libres et des esclaves en amérique . "),
        subtitle = uppercase("done by atlanta university . "), lab_1_name = "SLAVES \nESCLAVES", lab_2_name = "FREE — LIBRE",
        lab_1_pos = (1830, 60), lab_2_pos = (1830, 95))

end

@testset "Plate 53" begin
    # Random data
    r = DataFrame(y_var = repeat(["A", "B", "C", "D","E","F"],2),
        cat_var = cat(repeat(["G"],6),repeat(["H"],6), dims = (1,1)),
        x1 = (rand(1:10, 12).+20),
        x2 = (rand(1:10, 12).+10),
        x3 = (rand(1:10, 12).+5),
        x4 = (rand(1:10, 12).+2))

        r.x5 = (100 .- (r.x1 + r.x2 + r.x3 + r.x4))

    ## Auto
    f=  Plate53(r, :y_var, :cat_var, [:x1, :x2, :x3, :x4, :x5], "Auto", "Auto", title_1 = "Title",
    title_2 = "Small Title", subtitle = "Subtitle", bot_lab = "Label")

    ## Manual
    g =  Plate53(r, :y_var, :cat_var, [:x1, :x2, :x3, :x4, :x5], [45 1.2;55 4.7;60 4.5;25 2;45 5.5],[45 1.2;55 4.7;60 4.5;25 2;45 5.5],
    title_1 = "Title", title_2 = "Small Title", subtitle = "Subtitle", bot_lab = "Label")

    ## Legend
    h = Plate53(r, :y_var, :cat_var, [:x1, :x2, :x3, :x4, :x5], "Legend", "Legend", title_1 = "Title",
    title_2 = "Small Title", subtitle = "Subtitle", bot_lab = "Label")

    # Testing original data
    data = CSV.read(joinpath(@__DIR__,"../data/original/Plate53.csv"),DataFrame)
    ## Auto
    i = Plate53(data, :Ages, :Gender, [:Single, :Married, :Widowed],"Auto", "Auto",
    title_1 = "Conjugal condition of American Negroes according to age periods.",
    title_2 = "Condition conjugale des Nègres Americains au point de vue de l' age.",
    subtitle = "Done by Atlanta University.", bot_lab = "PER CENTS.")


    ## Manual
    j = Plate53(data, :Ages, :Gender, [:Single, :Married, :Widowed],[45 1.2;55 4.7;95 8.5],
    [25 2;45 5.5;50 8.5], title_1 = "Conjugal condition of American Negroes according to age periods.",
    title_2 = "Condition conjugale des Nègres Americains au point de vue de l' age.", subtitle = "Done by Atlanta University.",
    bot_lab = "PER CENTS.")

    ## Legend
    k = Plate53(data, :Ages, :Gender, [:Single, :Married, :Widowed],"Legend", "Legend",
    title_1 = "Conjugal condition of American Negroes according to age periods.",
    title_2 = "Condition conjugale des Nègres Americains au point de vue de l' age.",
    subtitle = "Done by Atlanta University.", bot_lab = "PER CENTS.")
end
