module SummonerV4 # LOLTools

using ..LOLTools: AbstractDTO, lol_api_server, http_action, call_api
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

function summoner_by_name(api_key::String,
                          region::String,
                          summonerName::String ;
                          endpoint::HTTP.URI = lol_api_server(region),
                          action::Function = http_action)::SummonerDTO
    escapedSummonerName = HTTP.escapeuri(summonerName)
    call_api(SummonerDTO, api_key, action, endpoint, "/lol/summoner/v4/summoners/by-name/$escapedSummonerName")
end

function summoner_by_id(api_key::String,
                        region::String,
                        encryptedSummonerId::String ;
                        endpoint::HTTP.URI = lol_api_server(region),
                        action::Function = http_action)::SummonerDTO
    call_api(SummonerDTO, api_key, action, endpoint, "/lol/summoner/v4/summoners/$encryptedSummonerId")
end

end # module LOLTools.SummonerV4
