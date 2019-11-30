# gen/fetcher.jl
# https://developer.riotgames.com/docs/lol#data-dragon

include(normpath(@__DIR__, "common.jl")) # data_version locales resources

rootdir = normpath(@__DIR__, data_version)
for locale in locales
    datadir = normpath(rootdir, "data", locale)
    !isdir(datadir) && mkpath(datadir)
    for (k, v) in pairs(resources)
        path = normpath(datadir, string(k, ".json"))
        url = "http://ddragon.leagueoflegends.com/cdn/$data_version/data/$locale/$k.json"
        !isfile(path) && @info(download(url, path))
    end
end
