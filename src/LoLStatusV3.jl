module LoLStatusV3 # LOLTools

using ..LOLTools: AbstractDTO, lol_api_server, http_action, call_api
using HTTP

struct ShardStatus <: AbstractDTO
    name
    region_tag
    hostname
    services
    slug
    locales
    ShardStatus(name, region_tag, hostname, services, slug, locales) = new(name, region_tag, hostname, services, slug, locales)
end

"""
         shard_data(api_key::String,
                    region::String ;
                    endpoint::HTTP.URI = lol_api_server(region),
                    action::Function = http_action)::ShardStatus
"""
function shard_data(api_key::String,
                    region::String ;
                    endpoint::HTTP.URI = lol_api_server(region),
                    action::Function = http_action)::ShardStatus
    call_api(ShardStatus, api_key, action, endpoint, "/lol/status/v3/shard-data")
end

end # module LOLTools.LoLStatusV3
