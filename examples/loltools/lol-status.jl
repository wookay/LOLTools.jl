using LOLTools.LoLStatusV3

api_key = get(ENV, "RIOT_TOKEN", "")
region = "kr"

status = LoLStatusV3.shard_data(api_key, region)
@info status
