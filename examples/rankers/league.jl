using Rankers.Storages
using LOLTools: SummonerV4, LeagueV4, http_action

api_key = get(ENV, "RIOT_TOKEN", "")
region = "kr"

read_from_file = true # false
queue = "RANKED_SOLO_5x5"
league = LeagueV4.challengerleagues(api_key, region, queue; action=update_with(region, http_action, read_from_file=read_from_file, debug=true))
@info map(x -> (x.summonerName, x.leaguePoints), sort(league.entries, by = x -> x.leaguePoints, rev=true)[1:10])

summonerName = "DRX Deft"
summoner = SummonerV4.summoner_by_name(api_key, region, summonerName; action=store_with(region, http_action, debug=true))
encryptedSummonerId = summoner.id

entries = LeagueV4.entries_by_summoner_id(api_key, region, encryptedSummonerId; action=update_with(region, http_action, read_from_file=read_from_file, debug=true))
@info entries

queue, tier, division = "RANKED_SOLO_5x5", "DIAMOND", "I"
entries = LeagueV4.entries_by_queue_tier_division(api_key, region, queue, tier, division; action=update_with(region, http_action, read_from_file=read_from_file, debug=true))
@info first(entries)
