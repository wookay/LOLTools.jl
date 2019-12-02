module ChampionMasteryV4 # LOLTools

using ..LOLTools: AbstractDTO, lol_api_server, http_action, call_api
using HTTP

struct ChampionMasteryDTO <: AbstractDTO
    chestGranted
    championLevel
    championPoints
    championId
    championPointsUntilNextLevel
    lastPlayTime
    tokensEarned
    championPointsSinceLastLevel
    summonerId
    ChampionMasteryDTO(chestGranted, championLevel, championPoints, championId, championPointsUntilNextLevel, lastPlayTime, tokensEarned, championPointsSinceLastLevel, summonerId) = new(chestGranted, championLevel, championPoints, championId, championPointsUntilNextLevel, lastPlayTime, tokensEarned, championPointsSinceLastLevel, summonerId) 
end

"""
         by_summoner_id(api_key::String,
                        region::String,
                        encryptedSummonerId::String ;
                        endpoint::HTTP.URI = lol_api_server(region),
                        action::Function = http_action)::Vector{ChampionMasteryDTO}
"""
function by_summoner_id(api_key::String,
                        region::String,
                        encryptedSummonerId::String ;
                        endpoint::HTTP.URI = lol_api_server(region),
                        action::Function = http_action)::Vector{ChampionMasteryDTO}
    call_api(Vector{ChampionMasteryDTO}, api_key, action, endpoint, "/lol/champion-mastery/v4/champion-masteries/by-summoner/$encryptedSummonerId")
end

"""
         by_summoner_id(api_key::String,
                        region::String,
                        encryptedSummonerId::String,
                        championId::Int64 ;
                        endpoint::HTTP.URI = lol_api_server(region),
                        action::Function = http_action)::ChampionMasteryDTO
"""
function by_summoner_id(api_key::String,
                        region::String,
                        encryptedSummonerId::String,
                        championId::Int64 ;
                        endpoint::HTTP.URI = lol_api_server(region),
                        action::Function = http_action)::ChampionMasteryDTO
    call_api(ChampionMasteryDTO, api_key, action, endpoint, "/lol/champion-mastery/v4/champion-masteries/by-summoner/$encryptedSummonerId/by-champion/$championId")
end

end # module LOLTools.ChampionMasteryV4
