```@meta
CurrentModule = DuBoisPlots
```

# DuBoisPlots

The package exports functions `PlateX(df::DataFrame,args;OptionalArgs)` that are used to replicate a specific plate. In addition, it also exports all the original data in `DuBoisData.PlateX`. To recreate Plate 51 you could thus do:
```@eval
using DuBoisPlots
using CairoMakie # hide
p51 = Plate51(DuBoisData.Plate51, :Year; 
        title="Proportion of Freemen and Salves Among American Negroes.",
        small_title="Proportion des Negres Libres et des Esclaves en Amerique",
        subtitle="Reproduced by DuBoisPlots.jl")
p11 = Plate11(DuBoisData.Plate11,:Population,[-0.0,0.12], [0.09,0.1], [0.025,0.075], [0.03,-0.09], [0.035,-0.035],
    "no", "City and Rural Population \n 1890.", " negroes in cities \n of over 10,000 inhabitants",
    " negroes in cities \n from 5,000 to 10,000", " \n negroes \n in cities \n from \n 2,500 to 5,000",
    " Negroes living in the country and villages")
save("plate51_index.png", p51) #hide
save("plate11_index.png", p11) #hide
nothing  #hide
```
|Plate 11                                     |Plate 51                    |
|:-------------------------------------------:|:---------------------------|
|![Plot!](plate11_index.png)|![Replication](plate51_index.png)|

## Index
```@index
```

## Automatic docs

```@autodocs
Modules = [DuBoisPlots]
```
