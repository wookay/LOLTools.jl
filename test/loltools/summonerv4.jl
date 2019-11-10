module test_loltools_summonerv4

using Test
using LOLTools.SummonerV4

include("helpers.jl")

struct SummonerController <: ApplicationController
    conn::Conn
end

function summoner_by_name(c::SummonerController)
    # @info :c c.params.summonerName
    render(JSON, (a=1,))
end

routes() do
    get("/lol/summoner/v4/summoners/by-name/:summonerName", SummonerController, summoner_by_name)
end

api_key = ""
region = "kr"
SummonerV4.summoner_by_name(api_key, region, "오뚜기3분미트볼"; action=mock_action)

end # module test_loltools_summonerv4
