using Rankers.Storages # store_with
using LOLTools.MatchV4: MatchV4, http_action
using LOLTools.DataDragon: en_US, ko_KR

api_key = get(ENV, "RIOT_TOKEN", "")
region = "kr"
matchId = 3999591966 # 3999564765
match = MatchV4.match_by_id(api_key, region, matchId; action=store_with(region, http_action, debug=true));
@info match.participantIdentities[7].player.summonerName
stats = match.participants[7].stats
f(d, k) = iszero(k) ? nothing : getindex(d, k).name
# (println ∘ f).(Ref(en_US.Items), [stats.item0, stats.item1, stats.item2, stats.item3, stats.item4, stats.item5, stats.item6])
(println ∘ f).(Ref(ko_KR.Items), [stats.item0, stats.item1, stats.item2, stats.item3, stats.item4, stats.item5, stats.item6])
