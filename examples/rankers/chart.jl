using Rankers.Storages
using Rankers.ProTeams
using LOLTools: SummonerV4, LeagueV4, http_action
using Rankers: Chart

api_key = get(ENV, "RIOT_TOKEN", "")
region = "kr"

read_from_file = !("u" in ARGS) # true # false
queue = "RANKED_SOLO_5x5"

get_ranking(::typeof(LeagueV4.challengerleagues), idx) = idx
get_ranking(::typeof(LeagueV4.grandmasterleagues), idx) = 300+idx
get_ranking(::typeof(LeagueV4.masterleagues), idx) = 1000+idx

rankers = Dict{String,Tuple{Union{Int,String},Int}}()
for league_func in (LeagueV4.challengerleagues, LeagueV4.grandmasterleagues, LeagueV4.masterleagues)
    league = league_func(api_key, region, queue; action=update_with(region, http_action, read_from_file=read_from_file, debug=true))
    for (idx, entry) in enumerate(Chart.entries(league))
        rankers[entry.summonerName] = (get_ranking(league_func, idx), entry.leaguePoints)
    end
end

chart = []
for player in players([DRX, FA], [Top, Jungle, Middle, ADC, Support])
    for summoner in summonersof(player)
        summonerName = summoner.name
        if !haskey(rankers, summonerName)
            summonerdto = SummonerV4.summoner_by_name(api_key, summoner.region, summoner.name; action=store_with(region, http_action, debug=true))
            encryptedSummonerId = summonerdto.id
            entries = LeagueV4.entries_by_summoner_id(api_key, summoner.region, encryptedSummonerId; action=update_with(summoner.region, http_action, read_from_file=read_from_file, debug=true))
            for entry in entries
                rankers[entry.summonerName] = (string(entry.tier, ' ', entry.rank), entry.leaguePoints)
                summonerName = entry.summonerName
            end
        end
        ranker = rankers[summonerName]
        push!(chart, (ranker..., summonerName))
    end
end
for entry in sort(chart, by = x -> x[2], rev=true)
    @info entry
end
