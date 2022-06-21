"""
Replicates Plate 11 (Unusual line chart).

You must pass a DataFrame two columns. The first column should be strings with the names of each category in the data. The
second column should be numeric values corresponding to each of those categories.

```julia
data = CSV.read(joinpath(@__DIR__,"../../data/original/Plate11.csv"),DataFrame)
z = Plate11(data, :Population,[-0.0,0.12], [0.09,0.1], [0.025,0.075], [0.03,-0.09], [0.035,-0.035],
"no", "City and Rural Population \n 1890.", " negroes in cities \n of over 10,000 inhabitants",
" negroes in cities \n from 5,000 to 10,000", " \n negroes \n in cities \n from \n 2,500 to 5,000",
" Negroes living in the country and villages")
```
"""
function spirals(a1,nrot,N::Int)
  spiral(θ, a=a1, b=1) = @. b * θ * cos(θ + a), b * θ * sin(θ + a)
  grd=range(2*π, (nrot*2+2)π,length=N)
  x, y = spiral(grd) #You're adding 2π to skip an entire round (making space for the text)
  x = x./maximum(y) # Scale to be between (-1,1)
  y = y./maximum(y)
  points = Point2f.(-x,y)
  points .-= points[end] # Shift so that outer spiral start is at origin
  reverse!(points) # Reverse order so first point is outer edge
  return points
end

function SpiralLength(spiralpoints = Array{Point{2,Real},1})
  # Using Pythagoras to measure length of discrete spiral (summing distance between each point)
  Δ = sqrt.([(spiralpoints[i][1] - spiralpoints[i-1][1])^2 + (spiralpoints[i][2] - spiralpoints[i-1][2])^2 for i =2:length(spiralpoints)])
  sum(Δ)
end

function Plate11(df::DataFrame, vals::Symbol,
  lab1_pos, lab2_pos, lab3_pos, lab4_pos,
  lab5_pos::Array,
  show_axes = "",
  title = "", lab1="", lab2="", lab3="", lab4="")
  fig = Figure(resolution = (792,1008).*2) # Create figure element
  ax_title = Axis(
    fig[1:2, 1:60],  # Create an empty axis (control grids here) (which is the [1,1] "subplot")
  )
  title = title
  #tx_title = Label(fig[1,30], title, textsize = 20)

  ax = Axis(
    fig[10:45, 13:45]
  )

  ax_empty = Axis(
    fig[60, 1:50]
  )

  if show_axes == "no"
    @warn "If you need to see axes to place labels, set value to 'yes'."
   hidespines!(ax)
   hidespines!(ax_title)
   hidespines!(ax_empty)
   hidedecorations!(ax)
   hidedecorations!(ax_title)
   hidedecorations!(ax_empty)
  else
    @warn "These axes are useful for placing labels. Set value to 'no' get rid of axes."
    # hidespines!(ax)
    # hidespines!(ax_title)
    # hidespines!(ax_empty)
    # hidedecorations!(ax)
    # hidedecorations!(ax_title)
    # hidedecorations!(ax_empty)
  end

  Total = sum(df[:,vals])
  df[!,:length] = df[:,vals]/Total

  Npoints = 500
  pos = fill(Point2f(0,0),Npoints)

  # Find indexes where line segments start or end
  i0 = 1
  i1 = round(Int,sum(df.length[1:1])*Npoints)
  i2 = round(Int,sum(df.length[1:2])*Npoints)
  i3 = round(Int,sum(df.length[1:3])*Npoints)
  i4 = round(Int,sum(df.length[1:4])*Npoints)
  pos[i0:i1] = [Point2f((i-1)/Npoints,0) for i=1:i1]
  pos[i1+1:i2] = [pos[i1] + sind(45)*Point2f(-(i-1)/Npoints,-(i-1)/Npoints) for i=1:i2-i1]
  pos[i2+1:i3] = [pos[i2] + sind(45)*Point2f((i-1)/Npoints,-(i-1)/Npoints) for i=1:i3-i2]

  # last line consists of two components: straight line and spiral. Find kinkpoint:
  # kinkpoint after 10% of the group
  pos[i3+1:i4] = [pos[i3] + sind(45)*Point2f(-(i-1)/Npoints,-(i-1)/Npoints) for i=1:i4-i3]
  ikink = i3 + round(Int,(i4-i3)*0.1)
  pos .-=pos[ikink] # Shift everything so that the kink is at the origin

  # Next create a superfine spiral with Nfine points
  Nfine = max(1000,Npoints*2)
  stepgrd = 1:round(Int,Nfine/15):Nfine
  finespiral = spirals(π,5.625,Nfine)/23

  truelength = (i4 - ikink)/Npoints # The length the spiral should have
  lengths = [SpiralLength(finespiral[1:i]) for i in stepgrd] # Find some lengths of the fine spiral
  ispiralstop = stepgrd[argmin(abs.(lengths.-truelength))] # Find the length that is closest
  pos = [pos[1:ikink]; finespiral[1:ispiralstop]] # Stack the original pos vector with the spiral up to it's desired length

  # Since lines are overlapping the order matters now :(
  lines!(ax,pos[i3+1:end], linewidth=10, color = colorant"#DC143C") # spiral
  lines!(ax,pos[i2:i3], linewidth=10, color = colorant"#FFD700") # second diagonal
  lines!(ax,pos[i1:i2], linewidth=10, color = colorant"#4682B4") # first diagonal
  lines!(ax,pos[i0:i1], linewidth=10, color = colorant"#00AA00") # top line

  # Drawing a fake line to expand size of axis
  xs = .075:0.005:.1
  ys = -0.05:0.03:0.1
  lines!(ax, xs,ys, color = colorant"#FFFFFF")
  xs2 = -0.06:0.002:-0.05
  ys2 = -0.05:0.03:0.1
   lines!(ax, xs2,ys2, color = colorant"#FFFFFF")
  xs3 = -0.05:0.03:0.1
  ys3 = -0.09:-0.001:-0.095
  lines!(ax, xs3,ys3, color = colorant"#FFFFFF")
  xs4 = -0.05:0.03:0.1
  ys4 = .11:0.001:.115
  lines!(ax, xs4,ys4, color = colorant"#FFFFFF")



  text1 = uppercase(string(df[1,2],lab1))
  text2 = uppercase(string(df[2,2],lab2))
  text3 = uppercase(string(df[3,2],lab3))
  text4 = uppercase(string(lab4))
  text5 = string(df[4,2])

  #########################
  # Label Position Syntax #
  #########################
 # The label positions are coded such that they can either be manually or automatically positioned in each plot. To manually
 # plot them, submit the string "Auto" as the value for each of the position inputs. Case-sensitive.
 #
 # In order to position them manually, submit five arrays for the values of lab1_pos through lab5_pos. They are
 # inputs that take floats or integers as elements in the arrays. The arrays need to have one
 # columns each and two rows. In order to manually position the labels, simply input those
 # points (coordinates).

labels = [lab1_pos,lab2_pos,lab3_pos,lab4_pos,lab5_pos]

for i in labels
 if typeof(i) == Array{Float64,1}
  i = i
 elseif typeof(i) == String
  if i == "Auto"
    i = 0
    @warn "The automatic option WILL look bad. You should manually set the label locations. For help setting these locations, set string value to 'yes' so you can see axes temporarily."
  else
    @warn "If not manually setting labels, submit string 'Auto' for automatic placement."
  end
end
end

  text!(ax, text1, position = Point.(lab1_pos[1],lab1_pos[2]), align = (:center, :center))
  text!(ax, text2, position = Point.(lab2_pos[1],lab2_pos[2]), align = (:center, :center))
  text!(ax, text3, position = Point.(lab3_pos[1],lab3_pos[2]), align = (:center, :center))
  text!(ax, text4, position = Point.(lab4_pos[1],lab4_pos[2]), align = (:center, :center))
  text!(ax, text5, position = Point.(lab5_pos[1],lab5_pos[2]), align = (:center, :center),textsize = 15)
  tx7 = Label(fig[2,30, Top()], title, textsize = 50)

  fig


end
