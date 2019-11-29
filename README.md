# LOLTools.jl

|  **Build Status**                |
|:---------------------------------|
|  [![][actions-img]][actions-url] |

https://developer.riotgames.com/apis


### MatchV4

```julia
using LOLTools.MatchV4

api_key = get(ENV, "RIOT_TOKEN", "")
region = "euw1"
match = MatchV4.match_by_id(api_key, region, 4249110676)
@info match.participantIdentities[10].player.summonerName == "FPX Doinb"
```

### SummonerV4

```julia
using LOLTools.SummonerV4

api_key = get(ENV, "RIOT_TOKEN", "")
region = "kr"
summoner = SummonerV4.summoner_by_name(api_key, region, "오뚜기3분미트볼")
@info SummonerV4.summoner_by_id(api_key, region, summoner.id) == summoner
```

### SpectatorV4

```julia
using LOLTools.SpectatorV4

api_key = get(ENV, "RIOT_TOKEN", "")
region = "kr"
featured = SpectatorV4.featured_games(api_key, region)
@info featured.gameList[1].participants
```

### LeagueV4

```julia
using LOLTools.LeagueV4

api_key = get(ENV, "RIOT_TOKEN", "")
region = "kr"
league = LeagueV4.by_queue(api_key, region, "RANKED_SOLO_5x5")
@info sort(league.entries, by = x -> x.leaguePoints)
```


[actions-img]: https://github.com/wookay/LOLTools.jl/workflows/CI/badge.svg
[actions-url]: https://github.com/wookay/LOLTools.jl/actions
