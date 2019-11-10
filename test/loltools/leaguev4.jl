module test_loltools_leaguev4

using Test
using LOLTools.LeagueV4

include("helpers.jl")

struct LeagueController <: ApplicationController
    conn::Conn
end

function by_queue(c::LeagueController)
    # @info :c c.params.entries
    render(JSON, (a=1,))
end

routes() do
    get("/lol/league/v4/challengerleagues/by-queue/:queue", LeagueController, by_queue)
end

api_key = ""
region = "kr"
LeagueV4.by_queue(api_key, region, "RANKED_SOLO_5x5"; action=mock_action)

end # module test_loltools_leaguev4
