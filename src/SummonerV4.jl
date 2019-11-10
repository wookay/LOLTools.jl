module SummonerV4 # LOLTools

using ..LOLTools: AbstractDTO, lol_api_server, http_action
using HTTP, JSON2

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
                          action::Function = http_action)::Union{Nothing, SummonerDTO}
    headers = ["X-Riot-Token" => api_key]
    resp = action(endpoint, "/lol/summoner/v4/summoners/by-name/$summonerName", headers)
    data = JSON2.read(IOBuffer(resp.body))
    SummonerDTO(data)
end

function summoner_by_id(api_key::String,
                        region::String,
                        encryptedSummonerId::String ;
                        endpoint::HTTP.URI = lol_api_server(region),
                        action::Function = http_action)::Union{Nothing, SummonerDTO}
    headers = ["X-Riot-Token" => api_key]
    resp = action(endpoint, "/lol/summoner/v4/summoners/$encryptedSummonerId", headers)
    data = JSON2.read(IOBuffer(resp.body))
    SummonerDTO(data)
end

end # module LOLTools.SummonerV4
