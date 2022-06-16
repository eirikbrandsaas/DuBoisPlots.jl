module DuBoisPlots

## Which packages we use
using CSV
using DataFrames
using Colors
using Weave
using CairoMakie

## Include and export plate recipes
include("Recipes/Plate7.jl")
include("Recipes/Plate51.jl")

export Plate7, Plate51

end