using Documenter
using LOLTools

makedocs(
    build = joinpath(@__DIR__, "local" in ARGS ? "build_local" : "build"),
    modules = [LOLTools,
               LOLTools.ChampionMasteryV4,
               LOLTools.ChampionV3,
               LOLTools.LoLStatusV3,
               LOLTools.LeagueV4,
               LOLTools.MatchV5,
               LOLTools.SpectatorV4,
               LOLTools.SummonerV4,
               LOLTools.GameClient,
              ],
    clean = false,
    format = Documenter.HTML(
        prettyurls = !("local" in ARGS),
        assets = ["assets/custom.css"],
    ),
    sitename = "LOLTools.jl",
    authors = "WooKyoung Noh",
    pages = Any[
        "Home" => "index.md",
        "API" => "API.md",
    ],
)
