using LOLTools.MatchV4

api_key = get(ENV, "RIOT_TOKEN", "")
region = "euw1"
match = MatchV4.match_by_id(api_key, region, 4249110676)
@info match
@info match.data.participantIdentities[10].player.summonerName == "FPX Doinb"
