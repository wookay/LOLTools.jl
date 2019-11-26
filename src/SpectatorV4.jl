module SpectatorV4 # LOLTools

using ..LOLTools: AbstractDTO, lol_api_server, http_action, call_api
using HTTP

struct FeaturedGames <: AbstractDTO
    clientRefreshInterval
    gameList
    FeaturedGames(clientRefreshInterval, gameList) = new(clientRefreshInterval, gameList)
end

function featured_games(api_key::String,
                        region::String ;
                        endpoint::HTTP.URI = lol_api_server(region),
                        action::Function = http_action)::FeaturedGames
    call_api(FeaturedGames, api_key, action, endpoint, "/lol/spectator/v4/featured-games")
end

end # module LOLTools.SpectatorV4
