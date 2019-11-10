module SpectatorV4 # LOLTools

using ..LOLTools: AbstractDTO, lol_api_server, http_action
using HTTP, JSON2

struct FeaturedGames <: AbstractDTO
    clientRefreshInterval
    gameList
    FeaturedGames(clientRefreshInterval, gameList) = new(clientRefreshInterval, gameList)
end

function featured_games(api_key::String,
                        region::String ;
                        endpoint::HTTP.URI = lol_api_server(region),
                        action::Function = http_action)::Union{Nothing, FeaturedGames}
    headers = ["X-Riot-Token" => api_key]
    resp = action(endpoint, "/lol/spectator/v4/featured-games", headers)
    data = JSON2.read(IOBuffer(resp.body))
    FeaturedGames(data)
end

end # module LOLTools.SpectatorV4
