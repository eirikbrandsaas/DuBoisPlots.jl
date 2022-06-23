# DuBoisPlots

[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://eirikbrandsaas.github.io/DuBoisPlots.jl/dev/)
[![Build Status](https://github.com/eirikbrandsaas/DuBoisPlots.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/eirikbrandsaas/DuBoisPlots.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/eirikbrandsaas/DuBoisPlots.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/eirikbrandsaas/DuBoisPlots.jl)

This is a package that allows users with little effort replicate the unique plots used by W. E. B. DuBois work studying the role of race in America. The graphical display he used at the 1900 Paris Exposition was groundbreaking and drew attention. 


The book *W. E. B. DuBois's Data Portraits: Visualizing Black America - The Color Line at the Turn of the Twentieth Century* (ISBN: 9781616897062) contains these and other plots, and is widely available for purchase (e.g.,  [Publisher](https://papress.com/products/w-e-b-du-boiss-data-portraits-visualizing-black-america), [Amazon](https://www.amazon.com/W-Boiss-Data-Portraits-Visualizing/dp/1616897066), [AbeBooks](https://www.abebooks.com/9781616897062/Boiss-Data-Portraits-Visualizing-Black-1616897066/plp))

## Adding new plates
To add a new plate please do the following:
1. Include the recipe in `src/Recipes/PlateXX.jl` with a docstring (see `src/Recipes/Plate7.jl` for an example)

For extra credit please also do

2. Include the original data in `data/original/PlateXX.csv`
3. Include a `.jpeg` of the original plate in `docs/figures/`
4. Add the plate to `docs/src/example.md`
