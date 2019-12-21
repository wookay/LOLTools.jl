module LOLTools

include("helpers.jl")

export MatchV4
include("MatchV4.jl")

export SummonerV4
include("SummonerV4.jl")

export SpectatorV4
include("SpectatorV4.jl")

export LeagueV4
include("LeagueV4.jl")

export LeagueExpV4
include("LeagueExpV4.jl")

export ChampionMasteryV4
include("ChampionMasteryV4.jl")

export ChampionV3
include("ChampionV3.jl")

export LoLStatusV3
include("LoLStatusV3.jl")

export DataDragon
include("DataDragon.jl")

export GameClient
include("GameClient.jl")

end # module LOLTools
