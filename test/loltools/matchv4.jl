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

Bukdu.start(8080)
Plug.Loggers.config[:path_pad] = 35

using HTTP
const local_api_server = HTTP.URI("http://localhost:8080/")

MatchV4.match_by_tournament_code("tournamentCode"; server=local_api_server)
MatchV4.match_by_id(0; server=local_api_server)

Bukdu.stop()

end # module test_loltools_matchv4
