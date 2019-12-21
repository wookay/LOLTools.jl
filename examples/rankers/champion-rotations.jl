using Rankers.Storages
using LOLTools: ChampionV3, http_action
using LOLTools.DataDragon.en_US

api_key = get(ENV, "RIOT_TOKEN", "")
region = "kr"

read_from_file = true
champs = ChampionV3.champion_rotations(api_key, region; action=update_with(region, http_action, read_from_file=read_from_file, debug=true))
for championId in champs.freeChampionIds
    print(en_US.Champions[championId].name)
    print("  --  ")
end
println()
