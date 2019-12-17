# generated
type = "champion"
format = "standAloneComplex"
version = v"9.24.2"
for locale in ("en_US", "ko_KR")
    gendir = normpath(@__DIR__, "9.24.2", "generated", locale)
    include(normpath(gendir, "module.jl"))
end
