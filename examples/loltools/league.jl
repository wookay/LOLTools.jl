using LOLTools.LeagueV4

api_key = get(ENV, "RIOT_TOKEN", "")
region = "kr"
league = LeagueV4.challengerleagues(api_key, region, "RANKED_SOLO_5x5")
@info sort(league.entries, by = x -> x.leaguePoints)
