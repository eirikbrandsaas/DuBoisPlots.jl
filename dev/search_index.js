var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = DuBoisPlots","category":"page"},{"location":"#DuBoisPlots","page":"Home","title":"DuBoisPlots","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for DuBoisPlots.","category":"page"},{"location":"","page":"Home","title":"Home","text":"This package allows you to create beatiful plots in the style of W. E. B. DuBois effortlessy. For example,","category":"page"},{"location":"","page":"Home","title":"Home","text":"using DuBoisPlots\n\ndf = DataFrame(\n        Year = [1790,1800,1810,1820,1830,1840,1850,1860,1870],\n        Slaves = [92,88.5,86.5,87,86,87,88,89,0],\n        Free =  [8.0, 11.5, 13.5, 13.0, 14.0, 13.0, 12.0, 11.0,100],\n        )\nPlate51(df, :Year; title=\"Proportion of Slaves\")","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [DuBoisPlots]","category":"page"},{"location":"#DuBoisPlots.Plate51-Tuple{DataFrames.DataFrame, Symbol}","page":"Home","title":"DuBoisPlots.Plate51","text":"Replicates Plate 51 (Stacked Area Chart).\n\nYou must pass a DataFrame with three columns. You must specify the column symbol for the x-axis variable. Each row of the remaining variables must sum to 100.\n\ndf = DataFrame(t=[1,2],x1=[25,35],x2=[75,65])\nPlate51(df,:t)\n\n\n\n\n\n","category":"method"},{"location":"#DuBoisPlots.Plate7-Tuple{DataFrames.DataFrame, Symbol}","page":"Home","title":"DuBoisPlots.Plate7","text":"Replicates Plate 7 (Flipped Time Series).\n\nYou must pass a DataFrame with at least two columns. You must specify the column symbol for the x-axis variable.\n\ndf = DataFrame(t=[1,2],x1=[25,35],x2=[75,65])\nPlate7(df,:t)\n\n\n\n\n\n","category":"method"}]
}
