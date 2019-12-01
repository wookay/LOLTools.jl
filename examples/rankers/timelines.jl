using Rankers.Storages # store_with
using LOLTools.MatchV4: MatchV4, http_action
using LOLTools.DataDragon: en_US, ko_KR

api_key = get(ENV, "RIOT_TOKEN", "")
region = "kr"
matchId = 3999591966 # 3999564765
timelines = MatchV4.timelines(api_key, region, matchId; action=store_with(region, http_action, debug=true));
frame = timelines.frames[end]
frame_par = frame.participantFrames[9]
@info frame_par
@info frame.events
@info frame.timestamp
