using LOLTools.MatchV5

api_key = get(ENV, "RIOT_TOKEN", "")
region = "asia"

# platformId = "KR"
# summonerName = "Chooooovyyyyyy"
puuid = "2SAuZFcOENdoO5UWE_h9DmGSU5MFkPgs0eQY-YqZKOSLLN7iOkYYCRm7Z1bx2lqq15KziYpKJ3w7-w"
matches = MatchV5.matches_by_puuid(api_key, region, puuid)
@info :matches matches

matchId = "KR_5424985325"

match = MatchV5.match_by_match_id(api_key, region, matchId)
# @info :match match

match_timeline = MatchV5.match_timeline_by_match_id(api_key, region, matchId)
# @info :match_timeline match_timeline
