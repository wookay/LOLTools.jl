# generated
type = "champion"
format = "standAloneComplex"
version = v"10.22.1"
for locale in ("en_US", "ko_KR")
    gendir = normpath(@__DIR__, "10.22.1", "generated", locale)
    include(normpath(gendir, "module.jl"))
end
