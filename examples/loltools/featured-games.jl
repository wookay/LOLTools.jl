using LOLTools.SpectatorV4

api_key = get(ENV, "RIOT_TOKEN", "")
region = "kr"
featured = SpectatorV4.featured_games(api_key, region)
@info featured.gameList[1].participants
