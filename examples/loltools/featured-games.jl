using LOLTools.SpectatorV4

api_key = get(ENV, "RIOT_TOKEN", "")
region = "kr"
featured = SpectatorV4.featured_games(api_key, region)
@info sort(featured.gameList, by = x -> x.gameId)[1].participants

featured2 = SpectatorV4.observer_mode_rest_featured(region)
@info sort(featured2.gameList, by = x -> x.gameId)[1].participants
