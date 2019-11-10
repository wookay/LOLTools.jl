# module LOLTools.MatchV4

using HTTP
using JSON2

abstract type AbstractMatch end

struct Match <: AbstractMatch
    data::NamedTuple
end

struct NoMatch <: AbstractMatch
end

function lol_api_server(region::String)::HTTP.URI
    merge(HTTP.URI("https://"), host=string(region, ".api.riotgames.com"), path="/")
end

function http_action(endpoint::HTTP.URI, path::String, headers::Vector{Pair{String,String}}=Vector{Pair{String,String}}(), query::Union{Nothing,Dict{String,String}}=nothing)
    url = string(merge(endpoint, path=path))
    HTTP.get(url, headers; query=query)
end

function match_by_tournament_code(api_key::String,
                                  region::String,
                                  tournamentCode::String ;
                                  endpoint::HTTP.URI = lol_api_server(region),
                                  action::Function = http_action)::AbstractMatch
    headers = ["X-Riot-Token" => api_key]
    resp = action(endpoint, "/lol/match/v4/matches/by-tournament-code/$tournamentCode/ids", headers)
    data = JSON2.read(IOBuffer(resp.body))
    Match(data)
end

function match_by_id(api_key::String,
                     region::String,
                     matchId::Int64 ;
                     endpoint::HTTP.URI = lol_api_server(region),
                     action::Function = http_action)::AbstractMatch
    headers = ["X-Riot-Token" => api_key]
    resp = action(endpoint, "/lol/match/v4/matches/$matchId", headers)
    data = JSON2.read(IOBuffer(resp.body))
    Match(data)
end

function matchlists(api_key::String,
                    region::String,
                    encryptedAccountId::String ;
                    endpoint::HTTP.URI = lol_api_server(region),
                    action::Function = http_action)
end

function timelines(api_key::String,
                   region::String,
                   matchId::String ;
                   endpoint::HTTP.URI = lol_api_server(region),
                   action::Function = http_action)
end

# module LOLTools.MatchV4
