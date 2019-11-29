# https://developer.riotgames.com/docs/lol#data-dragon
#=
wget http://ddragon.leagueoflegends.com/cdn/9.23.1/data/en_US/champion.json -P en_US
wget http://ddragon.leagueoflegends.com/cdn/9.23.1/data/ko_KR/champion.json -P ko_KR
=#

locales = ("en_US", "ko_KR")

using JSON2

nt = JSON2.read(read(normpath(@__DIR__, first(locales), "champion.json"), String))
champions_jl = normpath(@__DIR__, "Champions.jl")
f = open(champions_jl, "w")
write(f, "# generated\n")
write(f, "type = ", repr(nt.type), "\n")
write(f, "format = ", repr(nt.format), "\n")
write(f, "version = ", repr(VersionNumber(nt.version)), "\n")
write(f, """
for locale in $(repr(locales))
    include(normpath(@__DIR__, locale, "data.jl"))
end
""")
close(f)

for locale in locales
    data_jl = normpath(@__DIR__, locale, "data.jl")
    if locale == first(locales)
        global nt
    else
        nt = JSON2.read(read(normpath(@__DIR__, locale, "champion.json"), String))
    end
    f = open(data_jl, "w")
    write(f, "# generated\n")
    write(f, "module $locale\n")
    write(f, "Champions = Dict{Int,NamedTuple}(\n")
    for c in nt.data
        championId = parse(Int, c.key)
        write(f, repeat(' ', 4), repr(championId => c), ",\n")
    end
    write(f, ")\n")
    write(f, "end # module $locale\n")
    close(f)
end
