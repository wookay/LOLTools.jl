using Rankers.Storages
using Rankers.ProTeams
using LOLTools.SummonerV4: SummonerV4, http_action

api_key = get(ENV, "RIOT_TOKEN", "")
region = "kr"

summonerName = "오뚜기3분미트볼"
summoner = SummonerV4.summoner_by_name(api_key, region, summonerName; action=store_with(region, http_action, debug=true))

for summonerName in summonersof(players(DRX))
    summoner = SummonerV4.summoner_by_name(api_key, region, summonerName; action=store_with(region, http_action, debug=true))
end

for summonerName in summonersof(players(FA, [Mid, Top]))
    summoner = SummonerV4.summoner_by_name(api_key, region, summonerName; action=store_with(region, http_action, debug=true))
end
