# generated
type = "champion"
format = "standAloneComplex"
version = v"9.23.1"
for locale in ("en_US", "ko_KR")
    include(normpath(@__DIR__, locale, "data.jl"))
end
