```@meta
CurrentModule = DuBoisPlots
```

# DuBoisPlots

Documentation for [DuBoisPlots](https://github.com/eirikbrandsaas/DuBoisPlots.jl).

This package allows you to create beatiful plots in the style of W. E. B. DuBois effortlessy. For example,

```@example 1
using DuBoisPlots

df = DataFrame(
        Year = [1790,1800,1810,1820,1830,1840,1850,1860,1870],
        Slaves = [92,88.5,86.5,87,86,87,88,89,0],
        Free =  [8.0, 11.5, 13.5, 13.0, 14.0, 13.0, 12.0, 11.0,100],
        )
Plate51(df, :Year; title="Proportion of Slaves")
```

```@index
```

```@autodocs
Modules = [DuBoisPlots]
```
