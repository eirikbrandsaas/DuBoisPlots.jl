"""
Replicates Plate 25 (Spiral line chart).

You must pass a DataFrame with two columns. You must specify the column symbol for both
columns -- `spiral` should be the label for each variable, and `len` should be the numeric
value for each variable

```jl
df = DataFrame(Year = 1:6, Value = rand(6))
Plate25(df, :Year, :Value, "Title")
```
"""
function Plate25(data::DataFrame,spiral::Symbol, len::Symbol, title = "")
  df = copy(data)
  ## Assertions ##
  @assert size(df)[2] == 2 # There should be two columns: "Years" and "Household Value"
  #@assert size(df)[1] == 5
  @assert typeof(spiral) == Symbol
  @assert typeof(len) == Symbol

  lcolors = [colorant"#FFC0CB", colorant"#4682b4", colorant"#654321", colorant"#FFD700", :grey, colorant"#DC143C"]

  maxlength= maximum(df[!,len]) # Longest line
  maxlength*= 1.8 # But longest line cannot go all the way to the center
  df.length = df[!,len]/maxlength

  n = nrow(df) # number of lines
  nsections = 500 # number of points (more is smoother)
  angle = 6π # Higher number gives more rotations
  tvec = range(0,angle, length=nsections) # "Length" of spiral
  tmat = [tvec[argmin(abs.(tvec/tvec[end] .- (1.0-df[!,:length][i]))):end] for i =1:nrow(df)] # Line-specific length

  rotation_gain = 3.6 # Controls how tighly spaced the lines are
  linewidth=15

  fig = Figure(resolution = (792,1008))
  gt = fig[1,1] = GridLayout()
  gs = fig[1,2] = GridLayout()
  gp = fig[3,1] = GridLayout()
  ax = Axis(gp[1,1],aspect = 1,xticks=(-500:100:500),yticks=(-500:100:500))
  ylims!(-500,500)
  xlims!(-500,500)

  title = uppercase(title)
  Label(gt[1,1], align=(:center,:center), title, textsize = 23)

  hidespines!(ax)
  hidexdecorations!(ax)
  hideydecorations!(ax)

  spacer = [ # String vector with the custom legend-spacers in Plate 25 in the original book
    "----------\$",
    "--------\$",
    "------''  ",
    "------''",
    "------''",
    "------''",
     ]

  # Create each spiral and its legend
  for i in 1:n
    angvec = tmat[i]
    rvec = fill(0.0,length(angvec))
    for (ind,ang) in enumerate(angvec)
      rvec[ind] = r =  (i)*linewidth - (ang/4π) * (n*linewidth * rotation_gain)
    end

    points = Point2f.(sin.(angvec),-cos.(angvec)).*rvec
    push!(points,points[end] + Point2f(-5,0)) # Add a point a little to the left so that the edges are straight
    lines!(ax,points,linewidth=linewidth-3, color=:black)
    points[end] = points[end] + Point2f(1,0) # Shift "first" point a little to get the plack outline
    α = 0.9
    points[1] = Point2f.(sin.(angvec[2]*(1-α) + angvec[1]*(α)),-cos.(angvec[2]*(1-α) + angvec[1]α)).*(rvec[2]*(1-α) + rvec[1]*α)
    lines!(ax,points,linewidth=(linewidth-4.2), color=lcolors[i])
    text!(gp[1,1], align=(:right,:center),position=points[end] - Point2f(10.0,0), "$(df[i,1])"*spacer[i]*"$(df[i,2])",textsize=11)

  end

  # Spacing
  rowsize!(fig.layout, 1, 0)
  rowsize!(fig.layout, 2, 100)
  rowgap!(fig.layout, 2, 0)
  rowsize!(fig.layout, 3, 800)
  colsize!(fig.layout, 1, 750)

  fig
end
