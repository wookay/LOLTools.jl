using Rankers.Storages
using LOLTools.SummonerV4: SummonerV4, http_action

api_key = get(ENV, "RIOT_TOKEN", "")
region = "kr"

summonerName = "오뚜기3분미트볼"
summoner = SummonerV4.summoner_by_name(api_key, region, summonerName; action=store_with(region, http_action, debug=true))

using Rankers.ProTeams
for player in players(DRX)
    summoner = SummonerV4.summoner_by_name(api_key, region, player.summonerName; action=store_with(region, http_action, debug=true))
end
