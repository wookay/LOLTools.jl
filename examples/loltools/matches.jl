using LOLTools.MatchV4

api_key = get(ENV, "RIOT_TOKEN", "")
platform = "euw1"
match = MatchV4.match_by_id(api_key, platform, 4249110676)
@info match.participantIdentities[10].player.summonerName == "FPX Doinb"
