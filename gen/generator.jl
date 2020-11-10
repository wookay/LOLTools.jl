# gen/generator.jl
# https://developer.riotgames.com/docs/lol#data-dragon

include(normpath(@__DIR__, "common.jl")) # data_version locales resources

using ProgressMeter
using JSON2
json_read(path) = JSON2.read(Base.read(path, String))

locale = first(locales)
rootdir = normpath(@__DIR__, data_version)
datadir = normpath(rootdir, "data", locale)
path = normpath(datadir, "champion.json")
nt = json_read(path)
jl = normpath(@__DIR__, "locales.jl")
@info relpath(jl, @__DIR__)
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

for locale in locales
    local datadir = normpath(rootdir, "data", locale)
    gendir = normpath(@__DIR__, data_version, "generated", locale)
    !isdir(gendir) && mkpath(gendir)
    local jl = normpath(gendir, "module.jl")
    @info relpath(jl, @__DIR__)
    local f = open(jl, "w")
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
    for (k, v) in pairs(resources)
        local path = normpath(datadir, string(k, ".json"))
        local jl = normpath(gendir, string(k, ".jl"))
        local nt = json_read(path)
        @info relpath(jl, @__DIR__)
        local f = open(jl, "w")
        write(f, "# generated\n")
        local desc = string(locale, '/', basename(jl), ' ')
        if k in (:champion, :summoner)
            write(f, "$v = Dict{Int,NamedTuple}(\n")
            @showprogress 1 desc for c in nt.data
                id = parse(Int, c.key)
                write(f, repeat(' ', 4), repr(id => c), ",\n")
            end
            write(f, ")\n")
        elseif k === :item
            write(f, "$v = Dict{Int,NamedTuple}(\n")
            @showprogress 1 desc for (sym, c) in pairs(nt.data)
                maps = Dict(pairs(c.maps)...)
                d = merge(c, (maps=maps,))
                n = parse(Int, String(sym))
                write(f, repeat(' ', 4), repr(n => d), ",\n")
            end
            write(f, ")\n")
        end
        close(f)
    end
end
