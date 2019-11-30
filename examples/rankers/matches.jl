using Rankers.Storages # store_with
using LOLTools.MatchV4: MatchV4, http_action

api_key = get(ENV, "RIOT_TOKEN", "")
region = "kr"
match_id = 3999591966 # 3999564765
match = MatchV4.match_by_id(api_key, region, match_id; action=store_with(region, http_action, debug=true));
@info match.participantIdentities[7].player.summonerName
