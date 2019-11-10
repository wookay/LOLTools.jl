module MatchV4 # LOLTools

using ..LOLTools: AbstractDTO, lol_api_server, http_action
using HTTP, JSON2

struct MatchDTO <: AbstractDTO
    seasonId
    queueId
    gameId
    participantIdentities
    gameVersion
    platformId
    gameMode
    mapId
    gameType
    teams
    participants
    gameDuration
    gameCreation
    MatchDTO(seasonId, queueId, gameId, participantIdentities, gameVersion, platformId, gameMode, mapId, gameType, teams, participants, gameDuration, gameCreation) = new(seasonId, queueId, gameId, participantIdentities, gameVersion, platformId, gameMode, mapId, gameType, teams, participants, gameDuration, gameCreation)
end

function match_by_tournament_code(api_key::String,
                                  region::String,
                                  tournamentCode::String ;
                                  endpoint::HTTP.URI = lol_api_server(region),
                                  action::Function = http_action)::Union{Nothing, MatchDTO}
    headers = ["X-Riot-Token" => api_key]
    resp = action(endpoint, "/lol/match/v4/matches/by-tournament-code/$tournamentCode/ids", headers)
    data = JSON2.read(IOBuffer(resp.body))
    MatchDTO(data)
end

function match_by_id(api_key::String,
                     region::String,
                     matchId::Int64 ;
                     endpoint::HTTP.URI = lol_api_server(region),
                     action::Function = http_action)::Union{Nothing, MatchDTO}
    headers = ["X-Riot-Token" => api_key]
    resp = action(endpoint, "/lol/match/v4/matches/$matchId", headers)
    data = JSON2.read(IOBuffer(resp.body))
    MatchDTO(data)
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

end # module LOLTools.MatchV4
