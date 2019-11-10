module test_loltools_spectatorv4

using Test
using LOLTools.SpectatorV4

include("helpers.jl")

struct SpectatorController <: ApplicationController
    conn::Conn
end

function featured_games(c::SpectatorController)
    render(JSON, (a=1,))
end

routes() do
    get("/lol/spectator/v4/featured-games", SpectatorController, featured_games)
end

api_key = ""
region = "kr"
SpectatorV4.featured_games(api_key, region; action=mock_action)

end # module test_loltools_spectatorv4
