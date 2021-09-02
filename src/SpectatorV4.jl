module SpectatorV4 # LOLTools

using ..LOLTools: AbstractDTO, lol_api_server, http_action, call_api, nothing_in_event
using HTTP

struct FeaturedGames <: AbstractDTO
    clientRefreshInterval
    gameList
    FeaturedGames(clientRefreshInterval, gameList) = new(clientRefreshInterval, gameList)
end

struct CurrentGameInfo <: AbstractDTO
    gameId
    gameStartTime
    platformId
    gameMode
    mapId
    gameType
    bannedChampions
    observers
    participants
    gameLength
    gameQueueConfigId
    CurrentGameInfo(gameId, gameStartTime, platformId, gameMode, mapId, gameType, bannedChampions, observers, participants, gameLength, gameQueueConfigId) = new(gameId, gameStartTime, platformId, gameMode, mapId, gameType, bannedChampions, observers, participants, gameLength, gameQueueConfigId)
end

"""
         featured_games(api_key::String,
                        platform::String ;
                        endpoint::HTTP.URI = lol_api_server(platform),
                        action::Function = http_action,
                        event::Function = nothing_in_event)::FeaturedGames
"""
function featured_games(api_key::String,
                        platform::String ;
                        endpoint::HTTP.URI = lol_api_server(platform),
                        action::Function = http_action,
                        event::Function = nothing_in_event)::FeaturedGames
    call_api(FeaturedGames, api_key, action, endpoint, "/lol/spectator/v4/featured-games", event, featured_games)
end

"""
         active_games(api_key::String,
                      platform::String,
                      encryptedSummonerId::String ;
                      endpoint::HTTP.URI = lol_api_server(platform),
                      action::Function = http_action,
                      event::Function = nothing_in_event)::CurrentGameInfo
"""
function active_games(api_key::String,
                      platform::String,
                      encryptedSummonerId::String ;
                      endpoint::HTTP.URI = lol_api_server(platform),
                      action::Function = http_action,
                      event::Function = nothing_in_event)::CurrentGameInfo
    call_api(CurrentGameInfo, api_key, action, endpoint, "/lol/spectator/v4/active-games/by-summoner/$encryptedSummonerId", event, active_games)
end

end # module LOLTools.SpectatorV4
