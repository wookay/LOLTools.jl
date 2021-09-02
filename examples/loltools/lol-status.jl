using LOLTools.LoLStatusV3

api_key = get(ENV, "RIOT_TOKEN", "")
platform = "kr"

status = LoLStatusV3.shard_data(api_key, platform)
@info status
