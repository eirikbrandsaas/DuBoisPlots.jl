var documenterSearchIndex = {"docs":
[{"location":"examples/#Examples","page":"Examples","title":"Examples","text":"","category":"section"},{"location":"examples/","page":"Examples","title":"Examples","text":"To show how to use the package in more detail we show how to use the recipes to replicate  the original plates by DuBois.","category":"page"},{"location":"examples/#Plate-7","page":"Examples","title":"Plate 7","text":"","category":"section"},{"location":"examples/","page":"Examples","title":"Examples","text":"using DuBoisPlots #hide\nusing CairoMakie #hide\np = Plate7(DuBoisData.Plate7, :Year; \n        title=\"Comporative Increase if White and Colored \\n Population of Georgia\", xlabel = \"Percent\")\nsave(\"plate7.png\", p) #hide\nnothing  #hide","category":"page"},{"location":"examples/","page":"Examples","title":"Examples","text":"Original Replication\n(Image: Plot!) (Image: Replication)","category":"page"},{"location":"examples/#Plate-10","page":"Examples","title":"Plate 10","text":"","category":"section"},{"location":"examples/","page":"Examples","title":"Examples","text":"using DuBoisPlots #hide\nusing CairoMakie  #hide\np =Plate10(DuBoisData.Plate10,:Age,:Population, 3:5,\n        [\"15-55\", \"45-65\", \"65+\"],[\"Germany\", \"United States\"],[\"Single\", \"Divorced\", \"Married\"],\"Conjugal Condition\")\nsave(\"plate10.png\", p) #hide\nnothing  #hide","category":"page"},{"location":"examples/","page":"Examples","title":"Examples","text":"Original Replication\n(Image: Plot!) (Image: Replication)","category":"page"},{"location":"examples/#Plate-11","page":"Examples","title":"Plate 11","text":"","category":"section"},{"location":"examples/","page":"Examples","title":"Examples","text":"using DuBoisPlots #hide\nusing CairoMakie #hide\np = Plate11(DuBoisData.Plate11,:Population,[-0.0,0.12], [0.09,0.1], [0.025,0.075], [0.03,-0.09], [0.035,-0.035],\n    \"no\", \"City and Rural Population \\n 1890.\", \" negroes in cities \\n of over 10,000 inhabitants\",\n    \" negroes in cities \\n from 5,000 to 10,000\", \" \\n negroes \\n in cities \\n from \\n 2,500 to 5,000\",\n    \" Negroes living in the country and villages\")\nsave(\"plate11.png\", p) #hide\nnothing  #hide","category":"page"},{"location":"examples/","page":"Examples","title":"Examples","text":"Original Replication\n(Image: Plot!) (Image: Replication)","category":"page"},{"location":"examples/#Plate-25","page":"Examples","title":"Plate 25","text":"","category":"section"},{"location":"examples/","page":"Examples","title":"Examples","text":"using DuBoisPlots #hide\nusing CairoMakie #hide\np = Plate25(DuBoisData.Plate25,:Year,:Value,\"Assessed value of household and kitchen furniture \\n owned by Georgia negroes\")\nsave(\"plate25.png\", p) #hide\nnothing #hide","category":"page"},{"location":"examples/","page":"Examples","title":"Examples","text":"Original Replication\n(Image: Plot!) (Image: Replication)","category":"page"},{"location":"examples/#Plate-51","page":"Examples","title":"Plate 51","text":"","category":"section"},{"location":"examples/","page":"Examples","title":"Examples","text":"using DuBoisPlots #hide\nusing CairoMakie #hide\np = Plate51(DuBoisData.Plate51, :Year; \n        title=\"Proportion of Freemen and Salves Among American Negroes.\",\n        small_title=\"Proportion des Negres Libres et des Esclaves en Amerique\",\n        subtitle=\"Reproduced by DuBoisPlots.jl\")\nsave(\"plate51.png\", p)  #hide\nnothing #hide","category":"page"},{"location":"examples/","page":"Examples","title":"Examples","text":"Original Replication\n(Image: Plot!) (Image: Replication)","category":"page"},{"location":"examples/#Plate-53","page":"Examples","title":"Plate 53","text":"","category":"section"},{"location":"examples/","page":"Examples","title":"Examples","text":"using DuBoisPlots #hide\nusing CairoMakie #hide\np = Plate53(DuBoisData.Plate53,:Ages,:Gender,\n        [:Single, :Married, :Widowed],[45 1.2; 55 4.7; 95 8.5], [25 2; 45 5.5; 50 8.5],\n        title_1 = \"Conjugal condition of American Negroes according to age periods.\",\n        title_2 = \"Condition conjugale des Negres Americains au point de vlue de l' age.\",\n        subtitle = \"Done by Atlanta University.\", bot_lab = \"PER CENTS.\")\nsave(\"plate53.png\", p) #hide\nnothing #hide","category":"page"},{"location":"examples/","page":"Examples","title":"Examples","text":"Original Replication\n(Image: Plot!) (Image: Replication)","category":"page"},{"location":"","page":"Home","title":"Home","text":"CurrentModule = DuBoisPlots","category":"page"},{"location":"#DuBoisPlots","page":"Home","title":"DuBoisPlots","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The package exports functions PlateX(df::DataFrame,args;OptionalArgs) that are used to replicate a specific plate. In addition, it also exports all the original data in DuBoisData.PlateX. To recreate Plate 51 you could thus do:","category":"page"},{"location":"","page":"Home","title":"Home","text":"using DuBoisPlots\nusing CairoMakie # hide\np51 = Plate51(DuBoisData.Plate51, :Year; \n        title=\"Proportion of Freemen and Salves Among American Negroes.\",\n        small_title=\"Proportion des Negres Libres et des Esclaves en Amerique\",\n        subtitle=\"Reproduced by DuBoisPlots.jl\")\np11 = Plate11(DuBoisData.Plate11,:Population,[-0.0,0.12], [0.09,0.1], [0.025,0.075], [0.03,-0.09], [0.035,-0.035],\n    \"no\", \"City and Rural Population \\n 1890.\", \" negroes in cities \\n of over 10,000 inhabitants\",\n    \" negroes in cities \\n from 5,000 to 10,000\", \" \\n negroes \\n in cities \\n from \\n 2,500 to 5,000\",\n    \" Negroes living in the country and villages\")\nsave(\"plate51_index.png\", p51) #hide\nsave(\"plate11_index.png\", p11) #hide\nnothing  #hide","category":"page"},{"location":"","page":"Home","title":"Home","text":"Plate 11 Plate 51\n(Image: Plot!) (Image: Replication)","category":"page"},{"location":"#Index","page":"Home","title":"Index","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"#Automatic-docs","page":"Home","title":"Automatic docs","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Modules = [DuBoisPlots]","category":"page"},{"location":"#DuBoisPlots.Plate10","page":"Home","title":"DuBoisPlots.Plate10","text":"Replicates Plate 10 (Stacked and Grouped Bar Charts).\n\nYou must pass a DataFrame with five columns. The first column will be the main_cat argument in the function below. It should take as many values as you will have groups of bar charts. In the example, it takes three values, resulting in 3 groups of stacked charts. This column should be ordered [a a b b c c].\n\nThe second column will be the sub_cat argument – the sub-category. This column can only take two values. These values will correspond with the two bars in each group. In the example, there are two bars in each group (with three groups, six total bars). This column should be ordered [a b a b a b].\n\nThe rest of the columns will take numeric values. There should be one column per component of each stacked bar chart. For example, if the bar charts have three components, there will be three columns corresponding to each component. Each row of these columns should sum to 1 or 100. A maximum of three columns can be passed. If values are decimals, multiply them by 100 before running this function.\n\nThe \"range\" argument should take a range of integers (1:2, 4:5) which correspond to the indexes of the columns with numeric values.\n\nThe main_labs argument should be an array of strings (Array{String,1}) which correspond to the main_cat argument. This creates the labels for each set of grouped bars.\n\nThe sub_labs argument should be an array of strings (Array{String,1}) which correspond to the sub_cat argument. This creates the labels for each bar in each group.\n\nThe orders of the strings in both of these arrays matter!\n\ndf = DataFrame(main=[\"ab\",\"ab\",\"bc\",\"bc\",\"cd\",\"cd\"],sub=[\"a\",\"b\",\"a\",\"b\",\"a\",\"b\"],x1=[65,55,65,55,65,55,],x2 = [25,35,25,35,25,35],x3 = [10,10,10,10,10,10])\nPlate10(df, :main, :sub,3:5, [\"ab\", \"bc\",\"cd\"],[\"a\",\"b\"],[\"x1\",\"x2\",\"x3\"], \"title\")\n\n\n\n\n\n","category":"function"},{"location":"#DuBoisPlots.Plate11","page":"Home","title":"DuBoisPlots.Plate11","text":"Replicates Plate 11 (Unusual line chart).\n\nYou must pass a DataFrame two columns. The first column should be strings with the names of each category in the data. The second column should be numeric values corresponding to each of those categories (the name of this column should be passed as a symbol in the vals argument). There can only be 4 rows (maximum of 4 categories).\n\ndata = CSV.read(joinpath(@__DIR__,\"../../data/original/Plate11.csv\"),DataFrame)\nz = Plate11(data, :Population,[-0.0,0.12], [0.09,0.1], [0.025,0.075], [0.03,-0.09], [0.035,-0.035],\n\"no\", \"City and Rural Population \n 1890.\", \" negroes in cities \n of over 10,000 inhabitants\",\n\" negroes in cities \n from 5,000 to 10,000\", \" \n negroes \n in cities \n from \n 2,500 to 5,000\",\n\" Negroes living in the country and villages\")\n\n\n\n\n\n","category":"function"},{"location":"#DuBoisPlots.Plate25","page":"Home","title":"DuBoisPlots.Plate25","text":"Replicates Plate 25 (Spiral line chart).\n\nYou must pass a DataFrame with two columns. You must specify the column symbol for both columns – spiral should be the label for each variable, and len should be the numeric value for each variable\n\ndf = DataFrame(Year = 1:6, Value = rand(6))\nPlate25(df, :Year, :Value, \"Title\")\n\n\n\n\n\n","category":"function"},{"location":"#DuBoisPlots.Plate51-Tuple{DataFrame,Symbol}","page":"Home","title":"DuBoisPlots.Plate51","text":"Replicates Plate 51 (Stacked Area Chart).\n\nYou must pass a DataFrame with three columns. The first column will specify the x axis – this would be time or a similar parameter. Specify this column with the y_var argument. The second and third columns denote two categories which must sum to 100.\n\nLabels are optional arguments which can be passed as strings (title, subtitle, and labels for each of the two categories). If no value is passed for the lab1_pos and lab2_pos arguments, which are positions for each of the labels, then they will be automatically placed at (0,0), where they will likely not be seen. In order to place them yourself, pass an ordered pair of numbers for each.\n\ndf = DataFrame(t=[1,2],x1=[25,35],x2=[75,65])\nPlate51(df,:t, title = \"Title\", small_title = \"Small Title\", subtitle = \"Subtitle\", lab_1_name = \"Label 1\",\nlab_2_name = \"Label 2\", lab_1_pos = (1.5,20), lab_2_pos = (1.5,80))\n\n\n\n\n\n","category":"method"},{"location":"#DuBoisPlots.Plate53-Tuple{DataFrame,Symbol,Symbol,Array,Any,Any}","page":"Home","title":"DuBoisPlots.Plate53","text":"Replicates Plate 53 (Violin Chart).\n\nThis is a violin chart which is effectively made of two symmetric charts. The second column of the dataframe and y_var argument should be the categories that define those two plots. The first column of the dataframe and :cat_var argument should be the sub-categories within the plots; they will be the different colored regions within the chart area.\n\nThe remaining columns will be the values in each region. A number of things are important here. First, each row of these columns should sum to 100 or 1.0. Second, the way this chart works is that they are effectively horizontal stacked bar charts with mirrored x axes. There are as many bars as unique values in the sub-category column.\n\nThe label positions are coded such that they can either be manually or automatically positioned in each plot. To manually plot them, submit the string \"Auto\" as the value for each of the position inputs. To automatically create a legend instead of plotted labels, submit the string \"Legend\". Case-sensitive.\n\nIn order to position them manually, submit two arrays for the values of labpos1 and labpos2. They are required inputs that take floats or integers as elements in the arrays. The arrays need to have two columns each and as many rows as there are categories. As such, it's important that the coordinates be ordered in the same order as symbvec. For example: If `symbvec = [:a :b], the order of the coordinates with respect to the categories they belong to should look like this:[aplot1x aplot1y;bplot1x bplot1y]and[aplot2x aplot2y;bplot2x bplot2y]`. In order to manually position the labels, simply input those points (coordinates).\n\nr = DataFrame(y_var = repeat([\"A\", \"B\", \"C\", \"D\",\"E\",\"F\"],2),\n  cat_var = cat(repeat([\"G\"],6),repeat([\"H\"],6), dims = (1,1)),\n  x1 = (rand(1:10, 12).+20),\n  x2 = (rand(1:10, 12).+10),\n  x3 = (rand(1:10, 12).+5),\n  x4 = (rand(1:10, 12).+2))\n\n  r.x5 = (100 .- (r.x1 + r.x2 + r.x3 + r.x4))\n\nPlate53(r, :y_var, :cat_var, [:x1, :x2, :x3, :x4, :x5], \"Auto\", \"Auto\", title_1 = \"Title\",\n  title_2 = \"Small Title\", subtitle = \"Subtitle\", bot_lab = \"Label\")\n\n\n\n\n\n","category":"method"},{"location":"#DuBoisPlots.Plate7-Tuple{DataFrame,Symbol}","page":"Home","title":"DuBoisPlots.Plate7","text":"Replicates Plate 7 (Flipped Time Series).\n\nYou must pass a DataFrame with at least two columns. You must specify the column symbol for the x-axis variable. Note that if you are trying to plot more than 8 lines the colors and patterns will repeat – so, functionally, you should only plot up to 8 variables.\n\ndf = DataFrame(t=[1,2],x1=[25,35],x2=[75,65])\nPlate7(df,:t)\n\n\n\n\n\n","category":"method"}]
}
