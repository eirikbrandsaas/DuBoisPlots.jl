using DuBoisPlots
using Test

using DataFrames
using CSV

@testset "Plate 7" begin
    # Simple test
    p = Plate7(DuBoisData.Plate7, :t)

end

@testset "Plate 10" begin
    x = Plate10(DuBoisData.Plate10, :Age,:Population, 3:5,["15-40", "40-60", "60 and over"],["Negroes","Germany"],
       ["Single", "Widowed and Divorced", "Married"], "Conjugal Condition")

    df = DataFrame(main=["ab","ab","bc","bc","cd","cd"],sub=["a","b","a","b","a","b"],x1=[65,55,65,55,65,55,],x2 = [25,35,25,35,25,35],x3 = [10,10,10,10,10,10])
    w = Plate10(df, :main, :sub,3:5, ["ab", "bc","cd"],["a","b"],["x1","x2","x3"], "title")
end

@testset "Testing Plate 11" begin

    # Testing original data
    z = Plate11(DuBoisData.Plate11, :Population,[-0.0,0.12], [0.09,0.1], [0.025,0.075], [0.03,-0.09], [0.035,-0.035],
    "no", "City and Rural Population \n 1890.", " negroes in cities \n of over 10,000 inhabitants",
    " negroes in cities \n from 5,000 to 10,000", " \n negroes \n in cities \n from \n 2,500 to 5,000",
    " Negroes living in the country and villages")

    # Testing new data
    y = Plate11(DuBoisData.Plate11, :Population,[0.025,0.12], [0.03,0.1], [0.035,0.07], [0.035,-0.035], [0.035,-0.025],
    "no", "Northern Illinois Black Population by County \n 2019.", " DuPage",
    " Will", " \n Lake",
    " Cook")

    end

@testset "Plate 25" begin
    # Simple Test
    j = Plate25(DuBoisData.Plate25, :Year, :Value, "Title")

    # Testing with data
    k = Plate25(DuBoisData.Plate25, :Year, :Value, "Title")
end

@testset "Plate 51" begin
    # Simple test
    df = DataFrame(t=[1,2],x1=[25,35],x2=[75,65])
    d = Plate51(df,:t)

    # Testing optional arguments
    e = Plate51(DuBoisData.Plate51, :Year, title = uppercase("Proportion of freemen and slaves among american negroes . "),
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
    ## Auto
    i = Plate53(DuBoisData.Plate53, :Ages, :Gender, [:Single, :Married, :Widowed],"Auto", "Auto",
    title_1 = "Conjugal condition of American Negroes according to age periods.",
    title_2 = "Condition conjugale des Nègres Americains au point de vue de l' age.",
    subtitle = "Done by Atlanta University.", bot_lab = "PER CENTS.")


    ## Manual
    j = Plate53(DuBoisData.Plate53, :Ages, :Gender, [:Single, :Married, :Widowed],[45 1.2;55 4.7;95 8.5],
    [25 2;45 5.5;50 8.5], title_1 = "Conjugal condition of American Negroes according to age periods.",
    title_2 = "Condition conjugale des Nègres Americains au point de vue de l' age.", subtitle = "Done by Atlanta University.",
    bot_lab = "PER CENTS.")

    ## Legend
    k = Plate53(DuBoisData.Plate53, :Ages, :Gender, [:Single, :Married, :Widowed],"Legend", "Legend",
    title_1 = "Conjugal condition of American Negroes according to age periods.",
    title_2 = "Condition conjugale des Nègres Americains au point de vue de l' age.",
    subtitle = "Done by Atlanta University.", bot_lab = "PER CENTS.")
end

@testset "Data" begin
    @test DuBoisData.Plate7.Year[1] == 1790
    @test DuBoisData.Plate10.Population[1] == "Germany"
    @test DuBoisData.Plate11.Population[1] == 78139
    @test DuBoisData.Plate51.Year[1] == 1790
    @test DuBoisData.Plate53.Married[end] == 30
end
