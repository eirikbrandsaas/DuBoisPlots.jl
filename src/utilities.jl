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