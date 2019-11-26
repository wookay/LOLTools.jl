module LeagueV4 # LOLTools

using ..LOLTools: AbstractDTO, lol_api_server, http_action, call_api
using HTTP

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
                  action::Function = http_action)::LeagueListDTO
    call_api(LeagueListDTO, api_key, action, endpoint, "/lol/league/v4/challengerleagues/by-queue/$queue")
end

end # module LOLTools.LeagueV4
