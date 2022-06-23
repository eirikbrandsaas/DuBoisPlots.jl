module DuBoisPlots

## Which packages we use
using CSV
using DataFrames
using Colors
using Weave
using CairoMakie
using Base: Symbol
using Statistics

## Include and export plate recipes
include("Recipes/Plate7.jl")
include("Recipes/Plate10.jl")
include("Recipes/Plate11.jl")
include("Recipes/Plate25.jl")
include("Recipes/Plate51.jl")
include("Recipes/Plate53.jl")

## Include and export DataFrames
include("utilities.jl")
DuBoisData = (
    Plate7 =_Plate7df(),
    Plate10 =_Plate10df(),
    Plate11 =_Plate10df(),
    Plate25 =_Plate10df(),
    Plate51 =_Plate10df(),
    Plate53 =_Plate10df(),
)


export Plate7, Plate10, Plate11, Plate25, Plate51, Plate53
export DuBoisData
end
