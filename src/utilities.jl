function _Plate7df()
    CSV.read(joinpath(Base.@__DIR__,"..","data/original/Plate7.csv"),DataFrame)
end

function _Plate10df()
    CSV.read(joinpath(Base.@__DIR__,"..","data/original/Plate10.csv"),DataFrame)
end

function _Plate11df()
    CSV.read(joinpath(Base.@__DIR__,"..","data/original/Plate11.csv"),DataFrame)
end

function _Plate25df()
    CSV.read(joinpath(Base.@__DIR__,"..","data/original/Plate25.csv"),DataFrame)
end

function _Plate51df()
    CSV.read(joinpath(Base.@__DIR__,"..","data/original/Plate51.csv"),DataFrame)
end

function _Plate53df()
    CSV.read(joinpath(Base.@__DIR__,"..","data/original/Plate53.csv"),DataFrame)
end

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

