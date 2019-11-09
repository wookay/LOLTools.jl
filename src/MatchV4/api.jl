# module LOLTools.MatchV4

using HTTP

const LOL_API_SERVER = HTTP.URI("https://sfsfa.api.riotgames.com/")

abstract type AbstractMatch end

struct Match <: AbstractMatch
end

struct NoMatch <: AbstractMatch
end

function http_action(server::HTTP.URI, path::String, headers::Vector{Pair{String,String}}=[], query::Union{Nothing,Dict{String,String}}=nothing)
    url = string(merge(server, path=path))
    HTTP.get(url, headers; query=query)
end

function match_by_tournament_code(tournamentCode::String ;
                                  server::HTTP.URI=LOL_API_SERVER,
                                  action::Function=http_action)::AbstractMatch
    resp = action(server, "/lol/match/v4/matches/by-tournament-code/$tournamentCode/ids")
    resp.body
    NoMatch()
end

function match_by_id(matchId::Int64 ;
                     server::HTTP.URI=LOL_API_SERVER,
                     action::Function=http_action)::AbstractMatch
    resp = action(server, "/lol/match/v4/matches/$matchId")
    resp.body
    NoMatch()
end

function matchlists(encryptedAccountId ;
                    server::HTTP.URI=LOL_API_SERVER,
                    action::Function=http_action)
end

function timelines(matchId ;
                   server::HTTP.URI=LOL_API_SERVER,
                   action::Function=http_action)
end

# module LOLTools.MatchV4
