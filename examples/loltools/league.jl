using LOLTools.LeagueV4

api_key = get(ENV, "RIOT_TOKEN", "")
platform = "kr"
league = LeagueV4.challengerleagues(api_key, platform, "RANKED_SOLO_5x5")
@info sort(league.entries, by = x -> x.leaguePoints)[1:2]
