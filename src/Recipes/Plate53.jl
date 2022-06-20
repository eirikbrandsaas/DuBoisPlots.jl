"""
Replicates Plate 53 (Violin Chart).

This is a violin chart which is effectively made of two symmetric
charts. The first column of the dataframe should be the categories
that define those two plots. The second column of the dataframe
should be the sub-categories within the plots -- they will be the
different colored regions within the chart area.

The remaining columns will be the values in each region. A number of
things are important here. First, each row of these columns should
sum to 100 or 1.0. Second, the way this chart works is that they are
effectively horizontal stacked bar charts with mirrored x axes. There
are as many bars as unique values in the sub-category column.

```julia
r = DataFrame(y_var = repeat(["A", "B", "C", "D","E","F"],2),
  cat_var = cat(repeat(["G"],6),repeat(["H"],6), dims = (1,1)),
  x1 = (rand(1:10, 12).+20),
  x2 = (rand(1:10, 12).+10),
  x3 = (rand(1:10, 12).+5),
  x4 = (rand(1:10, 12).+2))

  r.x5 = (100 .- (r.x1 + r.x2 + r.x3 + r.x4))

Plate53(r, :y_var, :cat_var, [:x1, :x2, :x3, :x4, :x5], "Auto", "Auto", title_1 = "Title",
  title_2 = "Small Title", subtitle = "Subtitle", bot_lab = "Label")
```
"""
function Plate53(df::DataFrame, y_var::Symbol, cat_var::Symbol, symb_vec::Array, lab_pos_1, lab_pos_2; title_1 = "", title_2 = "", subtitle = "", bot_lab = "")
  @assert size(unique(df[:,cat_var]))[1] == 2 # Requires two plots. Could be changed, theoretically

  for i in 1:size(symb_vec)[1]
    @assert typeof(symb_vec[i]) == Symbol # Requires that each item in the symbol vector is a symbol. These will make up the subcategories of the plot
  end

  #for i in 1:nrow(df)
  #  @assert sum([df[i,xvar] for xvar in symb_vec]) == 100
  #end

  @assert size(symb_vec)[1] < 6



  nCat = size(symb_vec)[1]

  # If we set up a possibility for more than two plots, this should be a for loop.
  df1 = df[df[:,cat_var].==unique(df[:,cat_var])[1],:]
  df2 = df[df[:,cat_var].==unique(df[:,cat_var])[2],:]
  Nrow = nrow(df1)
  repCat = repeat(1:Nrow,nCat) # "x-axis" values (ages)
  grp = repeat(1:nCat, inner=Nrow) # Create vector


  fig = Figure(resolution = (792,1008)) # Create figure element
  gt = fig[1,1:3] = GridLayout()
  gp = fig[2,2] = GridLayout()
  g_legend = fig[3, 1:3] = GridLayout()
  gempty = fig[4,1:3] = GridLayout()
  g_left = fig[1:4, 1] = GridLayout()
  g_right = fig[1:4,3] = GridLayout()

  Label(gt[1,1], title_1, textsize = 20, color = :black) ## I made these labels because the text! function was getting cut off by axis lines. This works better.
  Label(gt[2,1], title_2, textsize = 20, color = :black)
  Label(gt[3,1], subtitle, textsize = 20, color = :black)
  ticklabels = [copy(df1[1:(end-1),y_var]);string(y_var,"\n",df1[end,y_var])] # The \n operator may not work correctly here

  ax1 = Axis(gp[1,1],
  xticks=(10:10:100),
  yticks=(1:Nrow, ticklabels),
  title = uppercase(unique(df[:,cat_var])[1]),
  xautolimitmargin=(0,0),
  yautolimitmargin=(0,0),
  )

  ax2 = Axis(gp[1,2],
  xticks=(10:10:100),
  yticks=(1:Nrow, ticklabels),
  title = uppercase(unique(df[:,cat_var])[2]),
  xautolimitmargin=(0,0),
  yautolimitmargin=(0,0),
  yaxisposition = (:right)
  )

  plots1 = []
  for i in 1:nCat
    append!(plots1, df1[:,symb_vec[i]];)
    plots1 = Int64.(plots1)
  end

  plots2 = []
  for i in 1:nCat
    append!(plots2, df2[:,symb_vec[i]];)
    plots2 = Int64.(plots2)
  end

  colors = [colorant"#4682B4",colorant"#DC143C", colorant"#00AA00", colorant"#FFD700",  colorant"#FFC0CB"] # colors are not in the right order...need to figure out

  bar1 = barplot!(ax1,repCat,plots1,
  stack=grp,
  color=colors[grp],
  colormap= colors,
  label = symb_vec[grp],
  width=1.10,
  direction = :x
  )

  bar2 = barplot!(ax2,repCat,plots2,
  stack=grp,
  color=colors[grp],
  colormap=colors,
  width=1.10,
  label = symb_vec[grp],
  direction = :x
  )

  colgap!(gp,0)
  xlims!(ax1, 100, 0)
  hideydecorations!(ax1, label = false, ticklabels = false)
  hideydecorations!(ax2, label = false, ticklabels = false)
  hidexdecorations!(ax1, label = false, ticklabels = false)
  hidexdecorations!(ax2, label = false, ticklabels = false)
  Label(gempty[1,1], bot_lab, textsize = 15, color = :black)

  #########################
  # Label Position Syntax #
  #########################
 # The label positions are coded such that they can either be manually or automatically positioned in each plot. To manually
 # plot them, submit the string "Auto" as the value for each of the position inputs. To automatically create a legend instead
 # of plotted labels, submit the string "Legend". Case-sensitive.
 #
 # In order to position them manually, submit two arrays for the values of lab_pos_1 and lab_pos_2. They are required
 # inputs that take floats or integers as elements in the arrays. The arrays need to have two
 # columns each and as many rows as there are categories. As such, it's important that the coordinates be ordered
 # in the same order as symb_vec. For example:
 # If symb_vec = ["a" "b" "c"], the order of the coordinates with respect to the categories they belong to should
 # look like this: ["a_plot_1" "b_plot_1" "c_plot_1"]. In order to manually position the labels, simply input those
 # points (coordinates).

 # This part of the if statement will code labels directly into the plot.

 label_positions = [lab_pos_1, lab_pos_2]

 if typeof(lab_pos_1) == Array{Float64, 2} && typeof(lab_pos_2) == Array{Float64,2}
   for i in 1:size(label_positions)[1]
     @assert size(label_positions[i]) == (nCat,2)
     for j in 1:nCat*2
       @assert typeof(label_positions[i][j]) == Float64 || typeof(label_positions[i][j]) == Int64
     end
   end
   for i in 1:nCat
     ix1 = lab_pos_1[i,:][1]
     iy1 = lab_pos_1[i,:][2]
     ix2 = lab_pos_2[i,:][1]
     iy2 = lab_pos_2[i,:][2]
     label = uppercase(string(symb_vec[i]))
     text!(ax1, label, position = Point.(ix1,iy1))
     text!(ax2, label, position = Point.(ix2,iy2))
   end
    # This part of the if statement will automatically place labels.
  elseif typeof(lab_pos_1) == Array{Int64, 2} && typeof(lab_pos_2) == Array{Int64,2}
    for i in 1:size(label_positions)[1]
      @assert size(label_positions[i]) == (nCat,2)
      for j in 1:nCat*2
        @assert typeof(label_positions[i][j]) == Float64 || typeof(label_positions[i][j]) == Int64
      end
    end
    for i in 1:nCat
      ix1 = lab_pos_1[i,:][1]
      iy1 = lab_pos_1[i,:][2]
      ix2 = lab_pos_2[i,:][1]
      iy2 = lab_pos_2[i,:][2]
      label = uppercase(string(symb_vec[i]))
      text!(ax1, label, position = Point.(ix1,iy1))
      text!(ax2, label, position = Point.(ix2,iy2))
    end
  elseif typeof(lab_pos_1) == String && typeof(lab_pos_2) == String
    @assert lab_pos_2 == lab_pos_1
    if lab_pos_1 == "Auto"
      for i in 1:nCat
        ix1 = mean(df1[:,symb_vec[i]])
        iy1 = argmax(df1[:,symb_vec[i]])
        ix2 = mean(df2[:,symb_vec[i]])
        iy2 = argmax(df2[:,symb_vec[i]])
        label = uppercase(string(symb_vec[i]))
        text!(ax1, label, position = Point.(ix1,iy1))
        text!(ax2, label, position = Point.(ix2,iy2))
      end
    elseif lab_pos_1 == "Legend"
      # empt = []
      # for i in 1:length(symb_vec)
      #   s = string(symb_vec[i])
      #   append!(empt,vcat(s))
      # end
      label = string.(symb_vec)
      elements = [PolyElement(polycolor = colors[i]) for i in 1:length(label)]
      Legend(g_legend[1,1], elements, label, orientation = :horizontal, framevisible = :false)
    else
      @warn "Either define the labels as 'Auto' or 'Legend'."
      @assert lab_pos_1 == "Legend" || lab_pos_1 == "Auto"
    end
  # This part of the if statement will throw an error if the labels are not the same type.
  elseif typeof(lab_pos_1) == Nothing && typeof(lab_pos_2) == Nothing
    @warn "By not submitting a label position, there will be no labels for categories."
  else
    @warn "lab_pos_1 and lab_pos_2 must be of the same type -- either both a string or both an array."
    @assert typeof(lab_pos_1) == typeof(lab_pos_2)
  end

  rowsize!(fig.layout, 1, Relative(0.15))
  rowsize!(fig.layout, 3, Relative(0.05))
  colsize!(fig.layout, 1, Relative(0.0005))
  colsize!(fig.layout,3,Relative(0.0005))
  rowgap!(fig.layout,0)

  fig
end
