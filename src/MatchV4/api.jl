# module LOLTools.MatchV4

using HTTP

const LOL_API_SERVER = HTTP.URI("https://sfsfa.api.riotgames.com/")

abstract type AbstractMatch end

struct Match <: AbstractMatch
end

struct NoMatch <: AbstractMatch
end

function http_action(endpoint::HTTP.URI, path::String, headers::Vector{Pair{String,String}}=[], query::Union{Nothing,Dict{String,String}}=nothing)
    url = string(merge(endpoint, path=path))
    HTTP.get(url, headers; query=query)
end

function match_by_tournament_code(tournamentCode::String ;
                                  endpoint::HTTP.URI=LOL_API_SERVER,
                                  action::Function=http_action)::AbstractMatch
    resp = action(endpoint, "/lol/match/v4/matches/by-tournament-code/$tournamentCode/ids")
    resp.body
    NoMatch()
end

function match_by_id(matchId::Int64 ;
                     endpoint::HTTP.URI=LOL_API_SERVER,
                     action::Function=http_action)::AbstractMatch
    resp = action(endpoint, "/lol/match/v4/matches/$matchId")
    resp.body
    NoMatch()
end

function matchlists(encryptedAccountId ;
                    endpoint::HTTP.URI=LOL_API_SERVER,
                    action::Function=http_action)
end

function timelines(matchId ;
                   endpoint::HTTP.URI=LOL_API_SERVER,
                   action::Function=http_action)
end

# module LOLTools.MatchV4
