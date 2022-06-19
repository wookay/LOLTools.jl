module ChampionMasteryV4 # LOLTools

using ..LOLTools: AbstractDTO, lol_api_server, http_action, call_api, nothing_in_event
using HTTP: URI

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
                        platform::String,
                        encryptedSummonerId::String ;
                        endpoint::URI = lol_api_server(platform),
                        action::Function = http_action,
                        event::Function = nothing_in_event)::Vector{ChampionMasteryDTO}
"""
function by_summoner_id(api_key::String,
                        platform::String,
                        encryptedSummonerId::String ;
                        endpoint::URI = lol_api_server(platform),
                        action::Function = http_action,
                        event::Function = nothing_in_event)::Vector{ChampionMasteryDTO}
    call_api(Vector{ChampionMasteryDTO}, api_key, action, endpoint, "/lol/champion-mastery/v4/champion-masteries/by-summoner/$encryptedSummonerId", event, by_summoner_id)
end

"""
         by_summoner_id(api_key::String,
                        platform::String,
                        encryptedSummonerId::String,
                        championId::Int64 ;
                        endpoint::URI = lol_api_server(platform),
                        action::Function = http_action,
                        event::Function = nothing_in_event)::ChampionMasteryDTO
"""
function by_summoner_id(api_key::String,
                        platform::String,
                        encryptedSummonerId::String,
                        championId::Int64 ;
                        endpoint::URI = lol_api_server(platform),
                        action::Function = http_action,
                        event::Function = nothing_in_event)::ChampionMasteryDTO
    call_api(ChampionMasteryDTO, api_key, action, endpoint, "/lol/champion-mastery/v4/champion-masteries/by-summoner/$encryptedSummonerId/by-champion/$championId", event, by_summoner_id)
end

end # module LOLTools.ChampionMasteryV4
