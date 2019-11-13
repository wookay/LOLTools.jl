module DataDragon # LOLTools

export Champions

include(normpath(@__DIR__, "..", "gen", "Champions.jl"))

end # module LOLTools.DataDragon
