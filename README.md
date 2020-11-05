# LOLTools.jl

|  **Documentation**                        |  **Build Status**                                                  |
|:-----------------------------------------:|:------------------------------------------------------------------:|
|  [![][docs-latest-img]][docs-latest-url]  |  [![][actions-img]][actions-url]  [![][codecov-img]][codecov-url]  |

### info
 * Riot Developer Portal :  <https://developer.riotgames.com/apis>
 * To get the `RIOT_TOKEN` :  <https://developer.riotgames.com/docs/portal#web-apis>

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
league = LeagueV4.challengerleagues(api_key, region, "RANKED_SOLO_5x5")
@info sort(league.entries, by = x -> x.leaguePoints, rev=true)[1:5]
```

### DataDragon

```julia
using LOLTools.DataDragon

champ = DataDragon.en_US.Champions[114]
@info champ.name == "Fiora"

champ = DataDragon.ko_KR.Champions[114]
@info champ.name == "피오라"
```


[docs-latest-img]: https://img.shields.io/badge/docs-latest-blue.svg
[docs-latest-url]: https://wookay.github.io/docs/LOLTools.jl/

[actions-img]: https://github.com/wookay/LOLTools.jl/workflows/CI/badge.svg
[actions-url]: https://github.com/wookay/LOLTools.jl/actions

[codecov-img]: https://codecov.io/gh/wookay/LOLTools.jl/branch/master/graph/badge.svg
[codecov-url]: https://codecov.io/gh/wookay/LOLTools.jl/branch/master


*LOLTools.jl* isn't endorsed by Riot Games and doesn't reflect the views or opinions of Riot Games or anyone officially involved in producing or managing League of Legends.
League of Legends and Riot Games are trademarks or registered trademarks of Riot Games, Inc. League of Legends (c) Riot Games, Inc.
