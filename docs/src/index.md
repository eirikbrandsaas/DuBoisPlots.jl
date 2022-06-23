```@meta
CurrentModule = DuBoisPlots
```

# DuBoisPlots

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
