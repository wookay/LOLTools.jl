module LeagueExpV4 # LOLTools

using ..LOLTools: lol_api_server, http_action, call_api, nothing_in_event
using ..LeagueV4: LeagueEntryDTO
using HTTP

"""
         entries_by_queue_tier_division(api_key::String,
                                        platform::String,
                                        queue::String,
                                        tier::String,
                                        division::String ;
                                        page::Int = 1,
                                        endpoint::HTTP.URI = lol_api_server(platform),
                                        action::Function = http_action,
                                        event::Function = nothing_in_event)::Set{LeagueEntryDTO}
"""
function entries_by_queue_tier_division(api_key::String,
                                        platform::String,
                                        queue::String,
                                        tier::String,
                                        division::String ;
                                        page::Int = 1,
                                        endpoint::HTTP.URI = lol_api_server(platform),
                                        action::Function = http_action,
                                        event::Function = nothing_in_event)::Set{LeagueEntryDTO}
    path = string(merge(HTTP.URI(path="/lol/league-exp/v4/entries/$queue/$tier/$division"), query=HTTP.escapeuri("page", page)))
    call_api(Set{LeagueEntryDTO}, api_key, action, endpoint, path, event, entries_by_queue_tier_division)
end

end # module LOLTools.LeagueExpV4
