# module LOLTools

abstract type AbstractDTO end

function (::Type{T})(nt::NT) where {T <: AbstractDTO, NT <: NamedTuple}
    T(get.(Ref(nt), fieldnames(T), nothing)...)
end

using HTTP

function lol_api_server(region::String)::HTTP.URI
    merge(HTTP.URI("https://"), host=string(region, ".api.riotgames.com"), path="/")
end

function http_action(endpoint::HTTP.URI, path::String, headers::Vector{Pair{String,String}}=Vector{Pair{String,String}}(), query::Union{Nothing,Dict{String,String}}=nothing)
    url = string(merge(endpoint, path=path))
    HTTP.get(url, headers; query=query)
end

# module LOLTools
