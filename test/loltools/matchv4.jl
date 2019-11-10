module test_loltools_matchv4

using Test
using LOLTools.MatchV4

@test MatchV4.match_by_tournament_code isa Function
@test MatchV4.match_by_id isa Function

using Bukdu
struct MatchController <: ApplicationController
    conn::Conn
end

function match_by_tournament_code(c::MatchController)
    # @info :c c.params.tournamentCode
    render(JSON, (a=1,))
end

function match_by_id(c::MatchController)
    # @info :c c.params.matchId
    render(JSON, (a=1,))
end

routes() do
    get("/lol/match/v4/matches/by-tournament-code/:tournamentCode/ids", MatchController, match_by_tournament_code)
    get("/lol/match/v4/matches/:matchId", MatchController, match_by_id)
end

function mock_action(endpoint, path, headers=[], query=nothing)
    if query !== nothing
        path = string(merge(HTTP.URI(path), query=query))
    end
    Router.call(get, path, headers).resp
end

merge!(Plug.Loggers.config, Dict(:action_pad => 25, :path_pad => 50))

api_key = ""
region = "na1"
MatchV4.match_by_tournament_code(api_key, region, "tournamentCode"; action=mock_action)
MatchV4.match_by_id(api_key, region, 0; action=mock_action)

end # module test_loltools_matchv4
