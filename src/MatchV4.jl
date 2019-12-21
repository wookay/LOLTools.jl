module MatchV4 # LOLTools

using ..LOLTools: AbstractDTO, lol_api_server, http_action, call_api
using HTTP

struct MatchDTO <: AbstractDTO
    seasonId
    queueId
    gameId
    participantIdentities::Vector{NamedTuple{(:participantId, :player), Tuple{Int,NamedTuple{(:platformId, :accountId, :summonerName, :summonerId, :currentPlatformId, :currentAccountId, :matchHistoryUri, :profileIcon)}}}}
    gameVersion
    platformId
    gameMode
    mapId
    gameType
    teams
    participants::Vector{NamedTuple{(:participantId, :teamId, :championId, :spell1Id, :spell2Id, :stats, :timeline)}}
    gameDuration
    gameCreation
    MatchDTO(seasonId, queueId, gameId, participantIdentities, gameVersion, platformId, gameMode, mapId, gameType, teams, participants, gameDuration, gameCreation) = new(seasonId, queueId, gameId, participantIdentities, gameVersion, platformId, gameMode, mapId, gameType, teams, participants, gameDuration, gameCreation)
end

const MatchReferenceDto = Tuple{(:platformId, :gameId, :champion, :queue, :season, :timestamp, :role, :lane)}

struct MatchlistDto <: AbstractDTO
    matches::Vector{MatchReferenceDto}
    totalGames
    startIndex
    endIndex
    MatchlistDto(matches, totalGames, startIndex, endIndex) = new(matches, totalGames, startIndex, endIndex)
end

struct MatchTimelineDto <: AbstractDTO
    frames
    frameInterval
    MatchTimelineDto(frames, frameInterval) = new(frames, frameInterval)
end

"""
         match_by_tournament_code(api_key::String,
                                  region::String,
                                  tournamentCode::String ;
                                  endpoint::HTTP.URI = lol_api_server(region),
                                  action::Function = http_action)::MatchDTO
"""
function match_by_tournament_code(api_key::String,
                                  region::String,
                                  tournamentCode::String ;
                                  endpoint::HTTP.URI = lol_api_server(region),
                                  action::Function = http_action)::MatchDTO
    call_api(MatchDTO, api_key, action, endpoint, "/lol/match/v4/matches/by-tournament-code/$tournamentCode/ids")
end

"""
         match_by_id(api_key::String,
                     region::String,
                     matchId::Int64 ;
                     endpoint::HTTP.URI = lol_api_server(region),
                     action::Function = http_action)::MatchDTO
"""
function match_by_id(api_key::String,
                     region::String,
                     matchId::Int64 ;
                     endpoint::HTTP.URI = lol_api_server(region),
                     action::Function = http_action)::MatchDTO
    call_api(MatchDTO, api_key, action, endpoint, "/lol/match/v4/matches/$matchId")
end

"""
         matchlists(api_key::String,
                    region::String,
                    encryptedAccountId::String ;
                    endpoint::HTTP.URI = lol_api_server(region),
                    action::Function = http_action)::MatchlistDto
"""
function matchlists(api_key::String,
                    region::String,
                    encryptedAccountId::String ;
                    endpoint::HTTP.URI = lol_api_server(region),
                    action::Function = http_action)::MatchlistDto
    call_api(MatchlistDto, api_key, action, endpoint, "/lol/match/v4/matchlists/by-account/$encryptedAccountId")
end

"""
         timelines(api_key::String,
                   region::String,
                   matchId::Int64 ;
                   endpoint::HTTP.URI = lol_api_server(region),
                   action::Function = http_action)::MatchTimelineDto
"""
function timelines(api_key::String,
                   region::String,
                   matchId::Int64 ;
                   endpoint::HTTP.URI = lol_api_server(region),
                   action::Function = http_action)::MatchTimelineDto
    call_api(MatchTimelineDto, api_key, action, endpoint, "/lol/match/v4/timelines/by-match/$matchId")
end

end # module LOLTools.MatchV4
