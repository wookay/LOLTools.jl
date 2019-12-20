api_key = get(ENV, "RIOT_TOKEN", "")
region = "kr"

using LOLTools.LeagueExpV4
entries = LeagueExpV4.entries_by_queue_tier_division(api_key, region, "RANKED_SOLO_5x5", "CHALLENGER", "I", page=1)
for entry in sort(collect(entries), by = x -> x.leaguePoints, rev=true)[1:5]
    @info :entry entry
end

using LOLTools.LeagueV4
entries = LeagueV4.entries_by_queue_tier_division(api_key, region, "RANKED_SOLO_5x5", "DIAMOND", "I", page=1)
for entry in sort(collect(entries), by = x -> x.leaguePoints, rev=true)[1:5]
    @info :entry entry
end
