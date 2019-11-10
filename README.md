# LOLTools.jl

|  **Build Status**                                                |
|:----------------------------------------------------------------:|
|  [![][travis-img]][travis-url]  [![][codecov-img]][codecov-url]  |


https://developer.riotgames.com/apis

```julia
using LOLTools.MatchV4

api_key = get(ENV, "RIOT_TOKEN", "")
region = "euw1"
match = MatchV4.match_by_id(api_key, region, 4249110676)
@info match
@info match.data.participantIdentities[10].player.summonerName == "FPX Doinb"
```


[travis-img]: https://api.travis-ci.org/wookay/LOLTools.jl.svg?branch=master
[travis-url]: https://travis-ci.org/wookay/LOLTools.jl

[codecov-img]: https://codecov.io/gh/wookay/LOLTools.jl/branch/master/graph/badge.svg
[codecov-url]: https://codecov.io/gh/wookay/LOLTools.jl/branch/master
