module SpectatorV4 # LOLTools

using ..LOLTools: AbstractDTO, lol_api_server, http_action, call_api
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

function featured_games(api_key::String,
                        region::String ;
                        endpoint::HTTP.URI = lol_api_server(region),
                        action::Function = http_action)::FeaturedGames
    call_api(FeaturedGames, api_key, action, endpoint, "/lol/spectator/v4/featured-games")
end

function active_games(api_key::String,
                      region::String,
                      encryptedSummonerId::String ;
                      endpoint::HTTP.URI = lol_api_server(region),
                      action::Function = http_action)::CurrentGameInfo
    call_api(CurrentGameInfo, api_key, action, endpoint, "/lol/spectator/v4/active-games/by-summoner/$encryptedSummonerId")
end

end # module LOLTools.SpectatorV4
