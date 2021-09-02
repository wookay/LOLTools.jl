module SummonerV4 # LOLTools

using ..LOLTools: AbstractDTO, lol_api_server, http_action, call_api, nothing_in_event
using HTTP

struct SummonerDTO <: AbstractDTO
    profileIconId
    name
    puuid
    summonerLevel
    revisionDate
    id
    accountId
    SummonerDTO(profileIconId, name, puuid, summonerLevel, revisionDate, id, accountId) = new(profileIconId, name, puuid, summonerLevel, revisionDate, id, accountId)
end

"""
         summoner_by_account(api_key::String,
                             platform::String,
                             encryptedAccountId::String ;
                             endpoint::HTTP.URI = lol_api_server(platform),
                             action::Function = http_action,
                             event::Function = nothing_in_event)::SummonerDTO
"""
function summoner_by_account(api_key::String,
                             platform::String,
                             encryptedAccountId::String ;
                             endpoint::HTTP.URI = lol_api_server(platform),
                             action::Function = http_action,
                             event::Function = nothing_in_event)::SummonerDTO
    call_api(SummonerDTO, api_key, action, endpoint, "/lol/summoner/v4/summoners/by-account/$encryptedAccountId", event, summoner_by_account)
end

"""
         summoner_by_puuid(api_key::String,
                           platform::String,
                           encryptedPUUID::String ;
                           endpoint::HTTP.URI = lol_api_server(platform),
                           action::Function = http_action,
                           event::Function = nothing_in_event)::SummonerDTO
"""
function summoner_by_puuid(api_key::String,
                           platform::String,
                           encryptedPUUID::String ;
                           endpoint::HTTP.URI = lol_api_server(platform),
                           action::Function = http_action,
                           event::Function = nothing_in_event)::SummonerDTO
    call_api(SummonerDTO, api_key, action, endpoint, "/lol/summoner/v4/summoners/by-puuid/$encryptedPUUID", event, summoner_by_puuid)
end

"""
         summoner_by_name(api_key::String,
                          platform::String,
                          summonerName::String ;
                          endpoint::HTTP.URI = lol_api_server(platform),
                          action::Function = http_action,
                          event::Function = nothing_in_event)::SummonerDTO
"""
function summoner_by_name(api_key::String,
                          platform::String,
                          summonerName::String ;
                          endpoint::HTTP.URI = lol_api_server(platform),
                          action::Function = http_action,
                          event::Function = nothing_in_event)::SummonerDTO
    escapedSummonerName = HTTP.escapeuri(summonerName)
    call_api(SummonerDTO, api_key, action, endpoint, "/lol/summoner/v4/summoners/by-name/$escapedSummonerName", event, summoner_by_name)
end

"""
         summoner_by_id(api_key::String,
                        platform::String,
                        encryptedSummonerId::String ;
                        endpoint::HTTP.URI = lol_api_server(platform),
                        action::Function = http_action,
                        event::Function = nothing_in_event)::SummonerDTO
"""
function summoner_by_id(api_key::String,
                        platform::String,
                        encryptedSummonerId::String ;
                        endpoint::HTTP.URI = lol_api_server(platform),
                        action::Function = http_action,
                        event::Function = nothing_in_event)::SummonerDTO
    call_api(SummonerDTO, api_key, action, endpoint, "/lol/summoner/v4/summoners/$encryptedSummonerId", event, summoner_by_id)
end

end # module LOLTools.SummonerV4
