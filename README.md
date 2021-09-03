# LOLTools.jl

|  **Documentation**                        |  **Build Status**                                                  |
|:-----------------------------------------:|:------------------------------------------------------------------:|
|  [![][docs-latest-img]][docs-latest-url]  |  [![][actions-img]][actions-url]  [![][codecov-img]][codecov-url]  |

### info
 * Riot Developer Portal :  <https://developer.riotgames.com/apis>
 * To get the `RIOT_TOKEN` :  <https://developer.riotgames.com/docs/portal#web-apis>

### MatchV5

```julia
using LOLTools.MatchV5

api_key = get(ENV, "RIOT_TOKEN", "")
region = "asia"
matchId = "KR_5424985325"
match = MatchV5.match_by_match_id(api_key, region, matchId)
@info match.info.participants[10].summonerName == "Chooooovyyyyyy"
```

### SummonerV4

```julia
using LOLTools.SummonerV4

api_key = get(ENV, "RIOT_TOKEN", "")
platform = "kr"
summoner = SummonerV4.summoner_by_name(api_key, platform, "오뚜기3분미트볼")
@info SummonerV4.summoner_by_id(api_key, platform, summoner.id) == summoner
```

### SpectatorV4

```julia
using LOLTools.SpectatorV4

api_key = get(ENV, "RIOT_TOKEN", "")
platform = "kr"
featured = SpectatorV4.featured_games(api_key, platform)
@info featured.gameList[1].participants
```

### LeagueV4

```julia
using LOLTools.LeagueV4

api_key = get(ENV, "RIOT_TOKEN", "")
platform = "kr"
league = LeagueV4.challengerleagues(api_key, platform, "RANKED_SOLO_5x5")
@info sort(league.entries, by = x -> x.leaguePoints, rev=true)[1:5]
```

### DataDragon
 * see <https://github.com/wookay/LOLToolsDataDragon.jl>


[docs-latest-img]: https://img.shields.io/badge/docs-latest-blue.svg
[docs-latest-url]: https://wookay.github.io/docs/LOLTools.jl/

[actions-img]: https://github.com/wookay/LOLTools.jl/workflows/CI/badge.svg
[actions-url]: https://github.com/wookay/LOLTools.jl/actions

[codecov-img]: https://codecov.io/gh/wookay/LOLTools.jl/branch/master/graph/badge.svg
[codecov-url]: https://codecov.io/gh/wookay/LOLTools.jl/branch/master


*LOLTools.jl* isn't endorsed by Riot Games and doesn't reflect the views or opinions of Riot Games or anyone officially involved in producing or managing League of Legends.
League of Legends and Riot Games are trademarks or registered trademarks of Riot Games, Inc. League of Legends (c) Riot Games, Inc.
