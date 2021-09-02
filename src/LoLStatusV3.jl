module LoLStatusV3 # LOLTools

using ..LOLTools: AbstractDTO, lol_api_server, http_action, call_api, nothing_in_event
using HTTP

struct ShardStatus <: AbstractDTO
    name
    platform_tag
    hostname
    services
    slug
    locales
    ShardStatus(name, platform_tag, hostname, services, slug, locales) = new(name, platform_tag, hostname, services, slug, locales)
end

"""
         shard_data(api_key::String,
                    platform::String ;
                    endpoint::HTTP.URI = lol_api_server(platform),
                    action::Function = http_action,
                    event::Function = nothing_in_event)::ShardStatus
"""
function shard_data(api_key::String,
                    platform::String ;
                    endpoint::HTTP.URI = lol_api_server(platform),
                    action::Function = http_action,
                    event::Function = nothing_in_event)::ShardStatus
    call_api(ShardStatus, api_key, action, endpoint, "/lol/status/v3/shard-data", event, shard_data)
end

end # module LOLTools.LoLStatusV3
