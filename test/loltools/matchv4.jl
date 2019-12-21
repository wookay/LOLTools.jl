module test_loltools_matchv4

using Test
using LOLTools.MatchV4

@test MatchV4.match_by_tournament_code isa Function
@test MatchV4.match_by_id isa Function

include("helpers.jl")

struct MatchController <: ApplicationController
    conn::Conn
end

match_tup = (seasonId=0, queueId=0, gameId=0, participantIdentities=[(participantId=1, player=(platformId = "KR", accountId = "", summonerName = "", summonerId = "", currentPlatformId = "KR", currentAccountId = "", matchHistoryUri = "/v1/stats/player_history/KR/", profileIcon = 0))], gameVersion=0, platformId=0, gameMode=0, mapId=0, gameType=0, teams=0, participants=[(participantId = 1, teamId = 100, championId = 516, spell1Id = 4, spell2Id = 12, stats =(), timeline = (participantId = 7,))], gameDuration=0, gameCreation=0)

function match_by_tournament_code(c::MatchController)
    # @info :c c.params.tournamentCode
    render(JSON, match_tup)
end

function match_by_id(c::MatchController)
    # @info :c c.params.matchId
    render(JSON, match_tup)
end

routes() do
    get("/lol/match/v4/matches/by-tournament-code/:tournamentCode/ids", MatchController, match_by_tournament_code)
    get("/lol/match/v4/matches/:matchId", MatchController, match_by_id)
end

api_key = ""
region = "na1"
MatchV4.match_by_tournament_code(api_key, region, "tournamentCode"; action=mock_action)
MatchV4.match_by_id(api_key, region, 0; action=mock_action)

end # module test_loltools_matchv4
