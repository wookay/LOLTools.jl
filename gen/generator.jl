using JSON2

# https://developer.riotgames.com/docs/lol
# wget http://ddragon.leagueoflegends.com/cdn/9.22.1/data/en_US/champion.json

nt = JSON2.read(read(normpath(@__DIR__, "champion.json"), String))

champions_jl = normpath(@__DIR__, "Champions.jl")
f = open(champions_jl, "w")
write(f, "# generated\n")
write(f, "# type = ", nt.type, "\n")
write(f, "# format = ", nt.format, "\n")
write(f, "# version = ", nt.version, "\n")

write(f, "Champions = Dict{Int,NamedTuple}(\n")
for c in nt.data
    championId = parse(Int, c.key)
    write(f, repeat(' ', 4), repr(championId => c), ",\n")
end
write(f, ")\n")

close(f)
