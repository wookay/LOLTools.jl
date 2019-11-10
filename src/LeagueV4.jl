module LeagueV4 # LOLTools

using ..LOLTools: AbstractDTO, lol_api_server, http_action
using HTTP, JSON2

struct LeagueListDTO <: AbstractDTO
    leagueId
    tier
    entries
    queue
    name
    LeagueListDTO(leagueId, tier, entries, queue, name) = new(leagueId, tier, entries, queue, name)
end

function by_queue(api_key::String,
                  region::String,
                  queue::String ;
                  endpoint::HTTP.URI = lol_api_server(region),
                  action::Function = http_action)::Union{Nothing, LeagueListDTO}
    headers = ["X-Riot-Token" => api_key]
    resp = action(endpoint, "/lol/league/v4/challengerleagues/by-queue/$queue", headers)
    data = JSON2.read(IOBuffer(resp.body))
    LeagueListDTO(data)
end

end # module LOLTools.LeagueV4
