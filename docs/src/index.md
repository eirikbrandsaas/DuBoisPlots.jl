```@meta
CurrentModule = DuBoisPlots
```

# DuBoisPlots

Documentation for [DuBoisPlots](https://github.com/eirikbrandsaas/DuBoisPlots.jl).

This package allows you to create beatiful plots in the style of W. E. B. DuBois effortlessy. For example,

```@example 1
using DuBoisPlots
using DataFrames
df = DataFrame(
        Year = [1790,1800,1810,1820,1830,1840,1850,1860,1870],
        Slaves = [92,88.5,86.5,87,86,87,88,89,0],
        Free =  [8.0, 11.5, 13.5, 13.0, 14.0, 13.0, 12.0, 11.0,100],
        )
Plate51(df, :Year; title="Proportion of Slaves")
```
## Usage
The package exports functions `PlateX(df::DataFrame,args;OptionalArgs)` that are used to replicate a specific plate. In addition, it also exports all the original data in `DuBoisData.PlateX`. To recreate Plate 51 you could thus do:
```@example 2
using DuBoisPlots
Plate51(DuBoisData.Plate51, :Year; 
        title="Proportion of Freemen and Salves Among American Negroes.",
        small_title="Proportion des Negres Libres et des Esclaves en Amerique",
        subtitle="Reproduced by DuBoisPlots.jl")
```

## Index
```@index
```

## Automatic docs

```@autodocs
Modules = [DuBoisPlots]
```
