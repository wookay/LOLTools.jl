module MatchV5 # LOLTools

using ..LOLTools: AbstractDTO, lol_api_server, http_action, call_api, nothing_in_event
using HTTP

"""
Get a list of match ids by puuid
matches_by_puuid(api_key::String,
                 region::String,
                 puuid::String ;
                 endpoint::HTTP.URI = lol_api_server(region),
                 action::Function = http_action,
                 event::Function = nothing_in_event)::Vector{String}
"""
function matches_by_puuid(api_key::String,
                          region::String,
                          puuid::String ;
                          endpoint::HTTP.URI = lol_api_server(region),
                          action::Function = http_action,
                          event::Function = nothing_in_event,
                          query::Union{Nothing,Dict{String,String}} = nothing)::Vector{String}
    call_api(Vector{String}, api_key, action, endpoint, "/lol/match/v5/matches/by-puuid/$puuid/ids", event, matches_by_puuid; query=query)
end

struct MatchDto <: AbstractDTO
    metadata
    info
end

"""
Get a match by match id
match_by_match_id(api_key::String,
                  region::String,
                  matchId::String ;
                  endpoint::HTTP.URI = lol_api_server(region),
                  action::Function = http_action,
                  event::Function = nothing_in_event)::MatchDto
"""
function match_by_match_id(api_key::String,
                           region::String,
                           matchId::String ;
                           endpoint::HTTP.URI = lol_api_server(region),
                           action::Function = http_action,
                           event::Function = nothing_in_event)::MatchDto
    call_api(MatchDto, api_key, action, endpoint, "/lol/match/v5/matches/$matchId", event, match_by_match_id)
end

struct MatchTimelineDto <: AbstractDTO
    metadata
    info
end

"""
Get a match timeline by match id
match_timeline_by_match_id(api_key::String,
                           region::String,
                           matchId::String ;
                           endpoint::HTTP.URI = lol_api_server(region),
                           action::Function = http_action,
                           event::Function = nothing_in_event)::MatchTimelineDto
"""
function match_timeline_by_match_id(api_key::String,
                                    region::String,
                                    matchId::String ;
                                    endpoint::HTTP.URI = lol_api_server(region),
                                    action::Function = http_action,
                                    event::Function = nothing_in_event)::MatchTimelineDto
    call_api(MatchTimelineDto, api_key, action, endpoint, "/lol/match/v5/matches/$matchId/timeline", event, match_timeline_by_match_id)
end

end # module LOLTools.MatchV5
