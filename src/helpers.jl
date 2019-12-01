# module LOLTools

abstract type AbstractDTO end

function (::Type{T})(nt::NT) where {T <: AbstractDTO, NT <: NamedTuple}
    T(get.(Ref(nt), fieldnames(T), nothing)...)
end

using HTTP, JSON2

function lol_api_server(region::String)::HTTP.URI
    merge(HTTP.URI("https://"), host=string(region, ".api.riotgames.com"), path="/")
end

function http_action(endpoint::HTTP.URI, path::String, headers::Vector{Pair{String,String}}=Vector{Pair{String,String}}(), query::Union{Nothing,Dict{String,String}}=nothing)
    url = string(merge(endpoint, path=path))
    HTTP.get(url, headers; query=query)
end

function call_api(::Type{T}, api_key::String, action::Function, endpoint::HTTP.URI, path::String)::T where T
    headers = ["X-Riot-Token" => api_key]
    resp = action(endpoint, path, headers)
    data = JSON2.read(IOBuffer(resp.body))
    if Symbol(T.name) === :Array
        first(T.parameters).(data)
    elseif Symbol(T.name) === :Set
        P = first(T.parameters)
        Set{P}(P.(data))
    else
        T(data)
    end
end

# module LOLTools
