module test_loltools_leaguev4

using Test
using LOLTools.LeagueV4

include("helpers.jl")

struct LeagueController <: ApplicationController
    conn::Conn
end

function challengerleagues(c::LeagueController)
    # @info :c c.params.entries
    render(JSON, (leagueId="", tier="CHALLENGER", entries=[(summonerId = "", summonerName = "", leaguePoints = 0, rank = "I", wins = 0, losses = 0, veteran = false, inactive = false, freshBlood = true, hotStreak = false)], queue="RANKED_SOLO_5x5", name="Nautilus's Outriders"))
end

routes() do
    get("/lol/league/v4/challengerleagues/by-queue/:queue", LeagueController, challengerleagues)
end

api_key = ""
region = "kr"
LeagueV4.challengerleagues(api_key, region, "RANKED_SOLO_5x5"; action=mock_action)

end # module test_loltools_leaguev4
