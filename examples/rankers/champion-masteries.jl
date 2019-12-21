using Rankers.Storages
using LOLTools: ChampionMasteryV4, SummonerV4, http_action
using LOLTools.DataDragon.en_US

api_key = get(ENV, "RIOT_TOKEN", "")
region = "kr"

summonerName = "DRX Deft"
read_from_file = true # false
summonerdto = SummonerV4.summoner_by_name(api_key, region, summonerName; action=store_with(region, http_action, debug=true))
encryptedSummonerId = summonerdto.id

champion_masteries = ChampionMasteryV4.by_summoner_id(api_key, region, encryptedSummonerId; action=update_with(region, http_action, read_from_file=read_from_file, debug=true))
for mastery in sort(champion_masteries, by = x -> x.championPoints, rev=true)[1:5]
    @info (en_US.Champions[mastery.championId].name, mastery.championPoints, mastery.lastPlayTime)
end

championId = 114
champion_masteries_114 = ChampionMasteryV4.by_summoner_id(api_key, region, encryptedSummonerId, championId; action=update_with(region, http_action, read_from_file=read_from_file, debug=true))
@info champion_masteries_114
using Calendars.Times
@info :lastPlayTime millisecond2datetime(champion_masteries_114.lastPlayTime)
