"""
Replicates Plate 51 (Stacked Area Chart).

You must pass a DataFrame with three columns. The first column will specify the x axis -- this
would be time or a similar parameter. Specify this column with the `y_var` argument. The second
and third columns denote two categories which must sum to 100.

Labels are optional arguments which can be passed as strings (title, subtitle, and labels for each
of the two categories). If no value is passed for the `lab1_pos` and `lab2_pos` arguments, which
are positions for each of the labels, then they will be automatically placed at (0,0), where they
will likely not be seen. In order to place them yourself, pass an ordered pair of numbers for each.

```jl
df = DataFrame(t=[1,2],x1=[25,35],x2=[75,65])
Plate51(df,:t, title = "Title", small_title = "Small Title", subtitle = "Subtitle", lab_1_name = "Label 1",
lab_2_name = "Label 2", lab_1_pos = (1.5,20), lab_2_pos = (1.5,80))
```
"""
function Plate51(data::DataFrame, y_var::Symbol; title="",small_title="",subtitle="", lab_1_name="", lab_2_name="",
  lab_1_pos = (0,0), lab_2_pos = (0,0))

  ## Setting up the data
  x_vars = data[:,Not.(y_var)]

  ## Assertions
  for i in 1:nrow(x_vars)
    @assert sum([x_vars[i,xvar] for xvar in names(x_vars)]) == 100
  end

  @assert size(x_vars)[2] == 2 # this could change

  ## Set up figure

  fig = Figure(resolution = (792,1008))

  gt = fig[1,1:3] = GridLayout()
  gs = fig[2,1:3] = GridLayout() # Hack to create more space between title and chart
  gf = fig[3,2] = GridLayout()

  ## Title part
  axtitle = Axis(gt[1, 1])
  axsmall_title = Axis(gt[2, 1])
  axsub = Axis(gt[3, 1])

  text!(axtitle, align=(:center,:center), title, textsize = 20)
  text!(axsmall_title, align=(:center,:center), small_title, textsize = 20)
  text!(axsub, align=(:center,:center), subtitle, textsize = 10)

  hidedecorations!(axtitle)
  hidespines!(axtitle)
  hidedecorations!(axsmall_title)
  hidespines!(axsmall_title)
  hidedecorations!(axsub)
  hidespines!(axsub)

  ## Chart part


  ax2 = Axis(gf[1,1],
    xaxisposition = :top,
    xautolimitmargin=(0,0),
    yautolimitmargin=(0,0.09),
    backgroundcolor = :white
  )
  ylims!(0,100)
  xlims!((minimum(data[:,y_var])),(maximum(data[:,y_var])))

  lower = zeros(nrow(data))
  band!(ax2, data[:,y_var], lower, x_vars[:,1],
  color = colorant"#000000")
  band!(ax2, data[:,y_var], (x_vars[:,1]), (x_vars[:,1] + x_vars[:,2]),
  color = colorant"#00AA00")

  if lab_1_pos == Point.(0,0)
    text!(lab_1_name, align=(:center,:center), position = Point.(mean(data[:, y_var]),10), color = :white, textsize=30)
  else
    text!(lab_1_name, align=(:center,:center), position = lab_1_pos, color = :white, textsize=30)
  end

  if lab_2_pos == Point.(0,0)
    text!(lab_2_name, align=(:center,:center), position = Point.(mean(data[:, y_var]),90), color = :black, textsize=30)
  else
    text!(lab_2_name, align=(:center,:center), position = lab_2_pos, color = :black, textsize=30)
  end

  hideydecorations!(ax2)
  hidespines!(ax2)

 alignvec = fill((:center,:center), nrow(x_vars))
 alignvec[1] = (:left,:center)
 alignvec[end] = (:right,:center)


 # Add an option to make this optional
 labels = x_vars[:,1]
 text!(ax2,
     ["$i%" for i in round.(Int,x_vars[:,2])],
     position= Point.((data[:,y_var]), (labels.+3)),
     textsize = 20,
     color = :white,
     align=alignvec
 )




 rowsize!(fig.layout, 1, Relative(0.15))
 rowsize!(fig.layout, 2, Relative(0.02))
 colsize!(fig.layout, 2, Relative(0.95))

 fig

end
