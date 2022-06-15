function Plate7(data::DataFrame, y_var::Symbol; title="",xlabel="")
  # Assertions
  if (size(data)[2] - 1)>8
    @warn "Color and pattern styles will be repeated because there are too many variables (>8)."
  end

  if data[:,y_var] != sort(data[:,y_var])
    @warn "Y should be sorted in order or else it will look weird."
  end

  # Structuring Data

  xvars = data[:,Not.(y_var)]

  # Structuring Figures

  fig = Figure(resolution = (792,1008)) # Create figure element
  gt = fig[1,1:3] = GridLayout()
  gp = fig[2,2] = GridLayout()
  gl = fig[3,1:3]
  gleftmarg = fig[1:3,1]
  grightmarg = fig[1:3,3]
  gbottomarg = fig[4,1:3] = GridLayout()

  # Styling

  axtitle = Axis(gt[1,1])
  title = uppercase(title)
  Label(gt[1,1], align=(:center,:center), title, textsize = 27)

  # Plotting

  minvec = []
  maxvec = []
for i in 1:size(xvars)[2]
  b = minimum(xvars[:,i])
  append!(minvec,b)
end

for i in 1:size(xvars)[2]
  b = maximum(xvars[:,i])
  append!(maxvec,b)
end

  axplot = Axis(gp[1,1],
    xgridcolor = colorant"#DC143C",
    ygridcolor = colorant"#DC143C",
    xlabel=uppercase(xlabel),
    xreversed=true,
    margin = (50,50,0,0),
    xminorticksvisible = true,
    xminorgridvisible = true,
    xminorgridcolor = colorant"#DC143C",
    xminorticks = IntervalsBetween(2),
    )
  ylims!(minimum(data[:,y_var]), maximum(data[:,y_var]))

  for i in 1:size(xvars)[2]
    lines!(axplot, xvars[:,i], data[:,y_var],
    linestyle = [:solid :dash][mod(i,2)+1], # Will alternate line styles
    color = [colorant"#4682B4" :black :black colorant"#00AA00" colorant"#00AA00" colorant"#FFD700" colorant"#FFD700" colorant"#4682B4"][mod(i,8)+1], #will alternate colors
    label= uppercase(names(xvars)[i])
    )
    xlims!(maximum(maxvec),minimum(minvec))
  end

  # More styling

  # Try auto legend
  Legend(gl, axplot, framevisible = false, orientation = :horizontal)

  rowsize!(fig.layout, 1, Relative(0.05))
  rowsize!(fig.layout, 3, Relative(0.02))
  rowsize!(fig.layout, 4, Relative(0.05))
  colsize!(fig.layout, 1, Relative(0.13))
  colsize!(fig.layout, 3, Relative(0.13))
  hidespines!(axtitle)
  hidedecorations!(axtitle)
  hideydecorations!(axplot, ticklabels = false, label = false, grid = false)
  tightlimits!.(axplot)

  fig

end
