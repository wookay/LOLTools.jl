using LOLTools.SummonerV4

api_key = get(ENV, "RIOT_TOKEN", "")
region = "kr"
summoner = SummonerV4.summoner_by_name(api_key, region, "오뚜기3분미트볼")
@info SummonerV4.summoner_by_id(api_key, region, summoner.id) == summoner

using LOLTools.ChampionMasteryV4
masteries = ChampionMasteryV4.by_summoner_id(api_key, region, summoner.id)
@info length(masteries)
for mastery in masteries[1:3]
    @info mastery
end
