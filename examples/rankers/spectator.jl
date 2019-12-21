using Rankers.Spectator

region = "kr"

#=
featured = Spectator.featured(region)
@info sort(featured.gameList, by = x -> x.gameId)[1].participants

version = Spectator.version(region)
@info :version version
=#

gameId = 4036891599
meta = Spectator.getGameMetaData(region, gameId)
@info :meta meta

#=
gameId = 4036891599
stats = Spectator.endOfGameStats(region, gameId)
@info :stats stats
=#
