using Rankers.Storages
using LOLTools.SummonerV4: SummonerV4, http_action
using LOLTools.SpectatorV4
using LOLTools.DataDragon.en_US

api_key = get(ENV, "RIOT_TOKEN", "")
region = "kr"
summonerName = "DRX Deft"
read_from_file = true # false
summonerdto = SummonerV4.summoner_by_name(api_key, region, summonerName; action=store_with(region, http_action, debug=true))
encryptedSummonerId = summonerdto.id
current_game = SpectatorV4.active_games(api_key, region, encryptedSummonerId; action=update_with(region, http_action, read_from_file=read_from_file, debug=true))
for participant in current_game.participants
    print("*", participant.summonerName)
    print(" ---- ")
    println(en_US.SummonerSpells[participant.spell1Id].name, ' ', en_US.SummonerSpells[participant.spell2Id].name)
end
