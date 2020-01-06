module LeagueV4 # LOLTools

using ..LOLTools: AbstractDTO, lol_api_server, http_action, call_api, nothing_in_event
using HTTP

struct LeagueListDTO <: AbstractDTO
    leagueId
    tier
    entries::Vector{NamedTuple{(:summonerId, :summonerName, :leaguePoints, :rank, :wins, :losses, :veteran, :inactive, :freshBlood, :hotStreak)}}
    queue
    name
    LeagueListDTO(leagueId, tier, entries, queue, name) = new(leagueId, tier, entries, queue, name)
end

struct LeagueEntryDTO <: AbstractDTO
    queueType
    summonerName
    hotStreak
    miniSeries
    wins
    veteran
    losses
    rank
    leagueId
    inactive
    freshBlood
    tier
    summonerId
    leaguePoints
    LeagueEntryDTO(queueType, summonerName, hotStreak, miniSeries, wins, veteran, losses, rank, leagueId, inactive, freshBlood, tier, summonerId, leaguePoints) = new(queueType, summonerName, hotStreak, miniSeries, wins, veteran, losses, rank, leagueId, inactive, freshBlood, tier, summonerId, leaguePoints)
end

"""
         challengerleagues(api_key::String,
                           region::String,
                           queue::String ;
                           endpoint::HTTP.URI = lol_api_server(region),
                           action::Function = http_action,
                           event::Function = nothing_in_event)::LeagueListDTO
"""
function challengerleagues(api_key::String,
                           region::String,
                           queue::String ;
                           endpoint::HTTP.URI = lol_api_server(region),
                           action::Function = http_action,
                           event::Function = nothing_in_event)::LeagueListDTO
    call_api(LeagueListDTO, api_key, action, endpoint, "/lol/league/v4/challengerleagues/by-queue/$queue", event, challengerleagues)
end

"""
        grandmasterleagues(api_key::String,
                           region::String,
                           queue::String ;
                           endpoint::HTTP.URI = lol_api_server(region),
                           action::Function = http_action,
                           event::Function = nothing_in_event)::LeagueListDTO
"""
function grandmasterleagues(api_key::String,
                           region::String,
                           queue::String ;
                           endpoint::HTTP.URI = lol_api_server(region),
                           action::Function = http_action,
                           event::Function = nothing_in_event)::LeagueListDTO
    call_api(LeagueListDTO, api_key, action, endpoint, "/lol/league/v4/grandmasterleagues/by-queue/$queue", event, grandmasterleagues)
end

"""
         masterleagues(api_key::String,
                       region::String,
                       queue::String ;
                       endpoint::HTTP.URI = lol_api_server(region),
                       action::Function = http_action,
                       event::Function = nothing_in_event)::LeagueListDTO
"""
function masterleagues(api_key::String,
                       region::String,
                       queue::String ;
                       endpoint::HTTP.URI = lol_api_server(region),
                       action::Function = http_action,
                       event::Function = nothing_in_event)::LeagueListDTO
    call_api(LeagueListDTO, api_key, action, endpoint, "/lol/league/v4/masterleagues/by-queue/$queue", event, masterleagues)
end

"""
         entries_by_summoner_id(api_key::String,
                                region::String,
                                encryptedSummonerId::String ;
                                endpoint::HTTP.URI = lol_api_server(region),
                                action::Function = http_action,
                                event::Function = nothing_in_event)::Set{LeagueEntryDTO}
"""
function entries_by_summoner_id(api_key::String,
                                region::String,
                                encryptedSummonerId::String ;
                                endpoint::HTTP.URI = lol_api_server(region),
                                action::Function = http_action,
                                event::Function = nothing_in_event)::Set{LeagueEntryDTO}
    call_api(Set{LeagueEntryDTO}, api_key, action, endpoint, "/lol/league/v4/entries/by-summoner/$encryptedSummonerId", event, entries_by_summoner_id)
end

"""
         entries_by_queue_tier_division(api_key::String,
                                        region::String,
                                        queue::String,
                                        tier::String,
                                        division::String ;
                                        page::Int = 1,
                                        endpoint::HTTP.URI = lol_api_server(region),
                                        action::Function = http_action,
                                        event::Function = nothing_in_event)::Set{LeagueEntryDTO}
"""
function entries_by_queue_tier_division(api_key::String,
                                        region::String,
                                        queue::String,
                                        tier::String,
                                        division::String ;
                                        page::Int = 1,
                                        endpoint::HTTP.URI = lol_api_server(region),
                                        action::Function = http_action,
                                        event::Function = nothing_in_event)::Set{LeagueEntryDTO}
    path = string(merge(HTTP.URI(path="/lol/league/v4/entries/$queue/$tier/$division"), query=HTTP.escapeuri("page", page)))
    call_api(Set{LeagueEntryDTO}, api_key, action, endpoint, path, event, entries_by_queue_tier_division)
end

end # module LOLTools.LeagueV4
