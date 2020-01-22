module MatchV4 # LOLTools

using ..LOLTools: AbstractDTO, lol_api_server, http_action, call_api, nothing_in_event
using HTTP

const ParticipantIdentityDTO = NamedTuple{(:participantId, :player), Tuple{Int, NamedTuple{(:platformId, :accountId, :summonerName, :summonerId, :currentPlatformId, :currentAccountId, :matchHistoryUri, :profileIcon)}}}
const TeamStatsDTO = NamedTuple{(:teamId, :win, :firstBlood, :firstTower, :firstInhibitor, :firstBaron, :firstDragon, :firstRiftHerald, :towerKills, :inhibitorKills, :baronKills, :dragonKills, :vilemawKills, :riftHeraldKills, :dominionVictoryScore, :bans)}
const ParticipantDTO = NamedTuple{(:participantId, :teamId, :championId, :spell1Id, :spell2Id, :stats, :timeline)}

struct MatchDTO <: AbstractDTO
    seasonId
    queueId
    gameId
    participantIdentities::Vector{ParticipantIdentityDTO}
    gameVersion
    platformId
    gameMode
    mapId
    gameType
    teams::Vector{TeamStatsDTO}
    participants::Vector{ParticipantDTO}
    gameDuration
    gameCreation
    MatchDTO(seasonId, queueId, gameId, participantIdentities, gameVersion, platformId, gameMode, mapId, gameType, teams, participants, gameDuration, gameCreation) = new(seasonId, queueId, gameId, participantIdentities, gameVersion, platformId, gameMode, mapId, gameType, teams, participants, gameDuration, gameCreation)
end

const MatchReferenceDTO = NamedTuple{(:platformId, :gameId, :champion, :queue, :season, :timestamp, :role, :lane)}

struct MatchlistDTO <: AbstractDTO
    matches::Vector{MatchReferenceDTO}
    totalGames
    startIndex
    endIndex
    MatchlistDTO(matches, totalGames, startIndex, endIndex) = new(matches, totalGames, startIndex, endIndex)
end

const MatchFrameDTO = NamedTuple{(:participantFrames, :events, :timestamp)}

struct MatchTimelineDTO <: AbstractDTO
    frames::Vector{MatchFrameDTO}
    frameInterval
    MatchTimelineDTO(frames, frameInterval) = new(frames, frameInterval)
end

"""
         match_by_tournament_code(api_key::String,
                                  region::String,
                                  tournamentCode::String ;
                                  endpoint::HTTP.URI = lol_api_server(region),
                                  action::Function = http_action,
                                  event::Function = nothing_in_event)::MatchDTO
"""
function match_by_tournament_code(api_key::String,
                                  region::String,
                                  tournamentCode::String ;
                                  endpoint::HTTP.URI = lol_api_server(region),
                                  action::Function = http_action,
                                  event::Function = nothing_in_event)::MatchDTO
    call_api(MatchDTO, api_key, action, endpoint, "/lol/match/v4/matches/by-tournament-code/$tournamentCode/ids", event, match_by_tournament_code)
end

"""
         match_by_id(api_key::String,
                     region::String,
                     matchId::Int64 ;
                     endpoint::HTTP.URI = lol_api_server(region),
                     action::Function = http_action,
                     event::Function = nothing_in_event)::MatchDTO
"""
function match_by_id(api_key::String,
                     region::String,
                     matchId::Int64 ;
                     endpoint::HTTP.URI = lol_api_server(region),
                     action::Function = http_action,
                     event::Function = nothing_in_event)::MatchDTO
    call_api(MatchDTO, api_key, action, endpoint, "/lol/match/v4/matches/$matchId", event, match_by_id)
end

"""
         matchlists(api_key::String,
                    region::String,
                    encryptedAccountId::String ;
                    endpoint::HTTP.URI = lol_api_server(region),
                    action::Function = http_action,
                    event::Function = nothing_in_event,
                    query::Union{Nothing,Dict{String,String}} = nothing)::MatchlistDTO
"""
function matchlists(api_key::String,
                    region::String,
                    encryptedAccountId::String ;
                    endpoint::HTTP.URI = lol_api_server(region),
                    action::Function = http_action,
                    event::Function = nothing_in_event,
                    query::Union{Nothing,Dict{String,String}} = nothing)::MatchlistDTO
    call_api(MatchlistDTO, api_key, action, endpoint, "/lol/match/v4/matchlists/by-account/$encryptedAccountId", event, matchlists; query=query)
end

"""
         timelines(api_key::String,
                   region::String,
                   matchId::Int64 ;
                   endpoint::HTTP.URI = lol_api_server(region),
                   action::Function = http_action,
                   event::Function = nothing_in_event)::MatchTimelineDTO
"""
function timelines(api_key::String,
                   region::String,
                   matchId::Int64 ;
                   endpoint::HTTP.URI = lol_api_server(region),
                   action::Function = http_action,
                   event::Function = nothing_in_event)::MatchTimelineDTO
    call_api(MatchTimelineDTO, api_key, action, endpoint, "/lol/match/v4/timelines/by-match/$matchId", event, timelines)
end

end # module LOLTools.MatchV4
