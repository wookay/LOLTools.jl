using Rankers.Storages # update_with
using LOLTools.SpectatorV4: SpectatorV4, http_action

api_key = get(ENV, "RIOT_TOKEN", "")
region = "kr"
read_from_file = true # false
featured = SpectatorV4.featured_games(api_key, region; action=update_with(region, http_action, read_from_file=read_from_file, debug=true))

n = 0
for gameinfo in featured.gameList
    for participant in gameinfo.participants
        print(participant.summonerName)
        print(" ---- ")
        global n += 1
    end
end
println()
println("count: $n")
