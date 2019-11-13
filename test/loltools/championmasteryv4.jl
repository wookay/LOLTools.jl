module test_loltools_championmasteryv4

using Test
using LOLTools.ChampionMasteryV4

include("helpers.jl")

struct CMController <: ApplicationController
    conn::Conn
end

function by_summoner_id(c::CMController)
    # @info :c c.params.encryptedSummonerId
    render(JSON, [(a=1,)])
end

routes() do
    get("/lol/champion-mastery/v4/champion-masteries/by-summoner/:encryptedSummonerId", CMController, by_summoner_id)
end

api_key = ""
region = "kr"
encryptedSummonerId = "id"
ChampionMasteryV4.by_summoner_id(api_key, region, encryptedSummonerId; action=mock_action)

end # module test_loltools_championmasteryv4
