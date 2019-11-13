module ChampionMasteryV4 # LOLTools

using ..LOLTools: AbstractDTO, lol_api_server, http_action
using HTTP, JSON2

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

function by_summoner_id(api_key::String,
                        region::String,
                        encryptedSummonerId::String ;
                        endpoint::HTTP.URI = lol_api_server(region),
                        action::Function = http_action)::Union{Nothing, Vector{ChampionMasteryDTO}}
    headers = ["X-Riot-Token" => api_key]
    resp = action(endpoint, "/lol/champion-mastery/v4/champion-masteries/by-summoner/$encryptedSummonerId", headers)
    data = JSON2.read(IOBuffer(resp.body))
    ChampionMasteryDTO.(data)
end

end # module LOLTools.ChampionMasteryV4
