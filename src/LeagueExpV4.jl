module LeagueExpV4 # LOLTools

using ..LOLTools: lol_api_server, http_action, call_api
using ..LeagueV4: LeagueEntryDTO
using HTTP

"""
         entries_by_queue_tier_division(api_key::String,
                                        region::String,
                                        queue::String,
                                        tier::String,
                                        division::String ;
                                        page::Int = 1,
                                        endpoint::HTTP.URI = lol_api_server(region),
                                        action::Function = http_action)::Set{LeagueEntryDTO}
"""
function entries_by_queue_tier_division(api_key::String,
                                        region::String,
                                        queue::String,
                                        tier::String,
                                        division::String ;
                                        page::Int = 1,
                                        endpoint::HTTP.URI = lol_api_server(region),
                                        action::Function = http_action)::Set{LeagueEntryDTO}
    path = string(merge(HTTP.URI(path="/lol/league-exp/v4/entries/$queue/$tier/$division"), query=HTTP.escapeuri("page", page)))
    call_api(Set{LeagueEntryDTO}, api_key, action, endpoint, path)
end

end # module LOLTools.LeagueExpV4
