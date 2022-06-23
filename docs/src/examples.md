# Examples 

To show how to use the package in more detail we show how to use the recipes to replicate 
the original plates by DuBois.

## testing
0
```@raw html
<img src="assets/original-plate-07.jpg" width="660px"/>
```
1
```@raw html
<img src="../assets/original-plate-07.jpg" width="660px"/>
```
2
```@raw html
<img src="../../assets/original-plate-07.jpg" width="660px"/>
```
3
```@raw html
<img src="../../../assets/original-plate-07.jpg" width="660px"/>
```
4
```@raw html
<img src="../../../../assets/original-plate-07.jpg" width="660px"/>
```

## Plate 7
![Plot!](../../assets/original-plate-07.jpg)

## Plate 10
![Plot!](../../assets/original-plate-10.jpg)

## Plate 11
![Plot!](../../assets/original-plate-11.jpg)

## Plate 25
![Plot!](../../assets/original-plate-25.jpg)

## Plate 51
```@eval
using DuBoisPlots
using DataFrames
using CairoMakie
df = DataFrame(
        Year = [1790,1800,1810,1820,1830,1840,1850,1860,1870],
        Slaves = [92,88.5,86.5,87,86,87,88,89,0],
        Free =  [8.0, 11.5, 13.5, 13.0, 14.0, 13.0, 12.0, 11.0,100],
        )
p = Plate51(df, :Year; title="Proportion of Slaves")
save("plate51.png", p)
pwd()#nothing
```
|Original                                     |Replication                 |
|:-------------------------------------------:|:---------------------------|
|![Plot!](../../../assets/original-plate-51.jpg)|![Replication](plate51.png)|

```@julia
println(pwd())
pwd()
```
## Plate 53
2
![Plot!](../../assets/original-plate-53.jpg)
1
![Plot!](../assets/original-plate-53.jpg)
0
![Plot!](assets/original-plate-53.jpg)
