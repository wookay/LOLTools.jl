module ChampionV3 # LOLTools

using ..LOLTools: AbstractDTO, lol_api_server, http_action, call_api, nothing_in_event
using HTTP: URI

struct ChampionInfo <: AbstractDTO
    freeChampionIdsForNewPlayers
    freeChampionIds
    maxNewPlayerLevel
    ChampionInfo(freeChampionIdsForNewPlayers, freeChampionIds, maxNewPlayerLevel) = new(freeChampionIdsForNewPlayers, freeChampionIds, maxNewPlayerLevel)
end

"""
         champion_rotations(api_key::String,
                            platform::String ;
                            endpoint::URI = lol_api_server(platform),
                            action::Function = http_action,
                            event::Function = nothing_in_event)::ChampionInfo
"""
function champion_rotations(api_key::String,
                            platform::String ;
                            endpoint::URI = lol_api_server(platform),
                            action::Function = http_action,
                            event::Function = nothing_in_event)::ChampionInfo
    call_api(ChampionInfo, api_key, action, endpoint, "/lol/platform/v3/champion-rotations", event, champion_rotations)
end

end # module LOLTools.ChampionV3
