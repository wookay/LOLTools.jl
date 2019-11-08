# module LOLTools.MatchV4

using HTTP

const LOL_API_SERVER = HTTP.URI("https://sfsfa.api.riotgames.com/")

abstract type AbstractMatch end

struct Match <: AbstractMatch
end

struct NoMatch <: AbstractMatch
end

function _get_request(name::Symbol, url::String)::Vector{UInt8}
    resp = HTTP.get(url)
    resp.body
end

function match_by_tournament_code(tournamentCode::String ;
                                  server::HTTP.URI=LOL_API_SERVER)::AbstractMatch
    url = string(merge(server, path="/lol/match/v4/matches/by-tournament-code/$tournamentCode/ids"))
    _get_request(:match_by_tournament_code, url)
    NoMatch()
end

function match_by_id(matchId::Int64 ;
                     server::HTTP.URI=LOL_API_SERVER)::AbstractMatch
    url = string(merge(server, path="/lol/match/v4/matches/$matchId"))
    _get_request(:match_by_id, url)
    NoMatch()
end

function matchlists(encryptedAccountId ;
                    server::HTTP.URI=LOL_API_SERVER)
end

function timelines(matchId ;
                   server::HTTP.URI=LOL_API_SERVER)
end

# module LOLTools.MatchV4
