using DuBoisPlots
using Documenter

DocMeta.setdocmeta!(DuBoisPlots, :DocTestSetup, :(using DuBoisPlots); recursive=true)

makedocs(;
    modules=[DuBoisPlots],
    authors="Eirik Eylands Brandsaas <eirik.e.brandsaas@frb.gov> and contributors",
    repo="https://github.com/eirikbrandsaas/DuBoisPlots.jl/blob/{commit}{path}#{line}",
    sitename="DuBoisPlots.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://eirikbrandsaas.github.io/DuBoisPlots.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/eirikbrandsaas/DuBoisPlots.jl",
    devbranch="main",
)
