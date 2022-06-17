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
include("Recipes/Plate25.jl")
include("Recipes/Plate51.jl")

export Plate7, Plate25, Plate51

end
