using Rankers.Storages
using Rankers.ProTeams
using LOLTools: SummonerV4, LeagueV4, http_action

api_key = get(ENV, "RIOT_TOKEN", "")
region = "kr"

read_from_file = true # false
queue = "RANKED_SOLO_5x5"

get_ranking(::typeof(LeagueV4.challengerleagues), idx) = idx
get_ranking(::typeof(LeagueV4.grandmasterleagues), idx) = 300+idx
get_ranking(::typeof(LeagueV4.masterleagues), idx) = 1000+idx

rankers = Dict{String,Tuple{Union{Int,String},Int}}()
for league_func in (LeagueV4.challengerleagues, LeagueV4.grandmasterleagues, LeagueV4.masterleagues)
    league = league_func(api_key, region, queue; action=update_with(region, http_action, read_from_file=read_from_file, debug=true))
    entries = sort(league.entries, by = x -> x.leaguePoints, rev=true)
    for (idx, entry) in enumerate(entries)
        rankers[entry.summonerName] = (get_ranking(league_func, idx), entry.leaguePoints)
    end
end

chart = []
for player in players([DRX, FA], [Top, Jungle, Mid, ADC, Support])
    for summonerName in summonersof(player)
        if !haskey(rankers, summonerName)
            summoner = SummonerV4.summoner_by_name(api_key, region, summonerName; action=store_with(region, http_action, debug=true))
            encryptedSummonerId = summoner.id
            entries = LeagueV4.entries_by_summoner_id(api_key, region, encryptedSummonerId; action=update_with(region, http_action, read_from_file=read_from_file, debug=true))
            for entry in entries
                rankers[entry.summonerName] = (string(entry.tier, ' ', entry.rank), entry.leaguePoints)
            end
        end
        ranker = rankers[summonerName]
        push!(chart, (ranker..., summonerName))
    end
end
for entry in sort(chart, by = x -> x[2], rev=true)
    @info entry
end
