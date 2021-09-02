module test_loltools_matchv5

using Test
using LOLTools.MatchV5

@test MatchV5.matches_by_puuid isa Function

include("helpers.jl")

struct MatchController <: ApplicationController
    conn::Conn
end

dict_matches_ids = Dict{String, Vector{String}}(
    "puuid1" => String[],
    "puuid2" => String["KR_12345", "KR_12346"],
)

function matches_by_puuid(c::MatchController)
    puuid = c.params.puuid
    matches_ids = dict_matches_ids[puuid]
    render(JSON, matches_ids)
end

res_match = (metadata=0, info=1)

function match_by_match_id(c::MatchController)
    render(JSON, res_match)
end

res_match_timeline = (metadata=0, info=1)

function match_timeline_by_match_id(c::MatchController)
    render(JSON, res_match_timeline)
end

routes() do
    get("/lol/match/v5/matches/by-puuid/:puuid/ids", MatchController, matches_by_puuid)
	get("/lol/match/v5/matches/:matchId", MatchController, match_by_match_id)
	get("/lol/match/v5/matches/:matchId/timeline", MatchController, match_timeline_by_match_id)
end

api_key = ""
region = "asia"

puuid = "puuid1"
@test MatchV5.matches_by_puuid(api_key, region, puuid; action=mock_action) == String[]

puuid = "puuid2"
@test MatchV5.matches_by_puuid(api_key, region, puuid; action=mock_action) == String["KR_12345", "KR_12346"]

matchId = "KR_12345"
MatchV5.match_by_match_id(api_key, region, matchId; action=mock_action)
MatchV5.match_timeline_by_match_id(api_key, region, matchId; action=mock_action)

end # module test_loltools_matchv5
