# generated
type = "champion"
format = "standAloneComplex"
version = v"11.17.1"
for locale in ("en_US", "ko_KR")
    gendir = normpath(@__DIR__, "11.17.1", "generated", locale)
    include(normpath(gendir, "module.jl"))
end
