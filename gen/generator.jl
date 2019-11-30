# gen/generator.jl
# https://developer.riotgames.com/docs/lol#data-dragon

include(normpath(@__DIR__, "common.jl")) # data_version locales resources

using JSON2

locale = first(locales)
rootdir = normpath(@__DIR__, data_version)
datadir = normpath(rootdir, "data", locale)
path = normpath(datadir, "champion.json")
nt = JSON2.read(read(path, String))
jl = normpath(@__DIR__, "locales.jl")
f = open(jl, "w")
write(f, "# generated\n")
write(f, "type = ", repr(nt.type), "\n")
write(f, "format = ", repr(nt.format), "\n")
write(f, "version = ", repr(VersionNumber(nt.version)), "\n")
write(f, """
for locale in $(repr(locales))
    gendir = normpath(@__DIR__, $(repr(data_version)), "generated", locale)
    include(normpath(gendir, "module.jl"))
end
""")
close(f)
@info jl

for locale in locales
    datadir = normpath(rootdir, "data", locale)
    gendir = normpath(@__DIR__, data_version, "generated", locale)
    !isdir(gendir) && mkpath(gendir)
    jl = normpath(gendir, "module.jl")
    f = open(jl, "w")
    write(f, """
    # generated
    module $locale # LOLTools.DataDragon
    """) 
    for (k, v) in pairs(resources)
        write(f, """
        include(normpath(@__DIR__, "$k.jl"))
        """)
    end
    write(f, "end # module LOLTools.DataDragon.$locale\n")
    close(f)
    @info jl
    for (k, v) in pairs(resources)
        path = normpath(datadir, string(k, ".json"))
        jl = normpath(gendir, string(k, ".jl"))
        nt = JSON2.read(read(path, String))
        f = open(jl, "w")
        write(f, "# generated\n")
        if k in (:champion, :summoner)
            write(f, "$v = Dict{Int,NamedTuple}(\n")
            for c in nt.data
                id = parse(Int, c.key)
                write(f, repeat(' ', 4), repr(id => c), ",\n")
            end
            write(f, ")\n")
        elseif k === :item
            write(f, "$v = Dict{String,NamedTuple}(\n")
            for c in nt.data
                maps = Dict(pairs(c.maps)...)
                d = merge(c, (maps=maps,))
                write(f, repeat(' ', 4), repr(c.name => d), ",\n")
            end
            write(f, ")\n")
        end
        close(f)
        @info jl
    end
end
