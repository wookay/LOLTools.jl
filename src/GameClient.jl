module GameClient # LOLTools

using HTTP, JSON2

function http_action(verb, endpoint::HTTP.URI, path::String, headers::Vector{Pair{String,String}}=Vector{Pair{String,String}}(), query::Union{Nothing,Dict{String,String}}=nothing, body=nothing)
    url = string(merge(endpoint, path=path))
    sc = HTTP.Servers.SSLConfig(false)
    args = (query=query, sslconfig=sc)
    if body === nothing
        verb(url, headers; args...)
    else
        verb(url, headers; body=body, args...)
    end
end

function lol_replay_server(; host="127.0.0.1", port=2999)::HTTP.URI
    merge(HTTP.URI("https://"), host=host, port=port, path="/")
end

function call_api(action, verb, endpoint, path)
    resp = action(verb, endpoint, path)
    data = JSON2.read(IOBuffer(resp.body))
end

function call_api(action, verb, endpoint, path, resource)
    headers = ["Content-Type" => "application/json"]
    body = JSON2.write(resource)
    resp = action(verb, endpoint, path, headers, nothing, body)
    data = JSON2.read(IOBuffer(resp.body))
end

"""
         replay_game( ;
                     endpoint::HTTP.URI = lol_replay_server(),
                     action::Function = http_action)
"""
function replay_game( ;
                     endpoint::HTTP.URI = lol_replay_server(),
                     action::Function = http_action)
    data = call_api(action, HTTP.get, endpoint, "/replay/game")
end

"""
         replay_particles( ;
                          endpoint::HTTP.URI = lol_replay_server(),
                          action::Function = http_action)
"""
function replay_particles( ;
                          endpoint::HTTP.URI = lol_replay_server(),
                          action::Function = http_action)
    data = call_api(action, HTTP.get, endpoint, "/replay/particles")
end

function replay_particles(particles ;
                          endpoint::HTTP.URI = lol_replay_server(),
                          action::Function = http_action)
    data = call_api(action, HTTP.post, endpoint, "/replay/particles", particles)
end

"""
         replay_playback( ;
                         endpoint::HTTP.URI = lol_replay_server(),
                         action::Function = http_action)
"""
function replay_playback( ;
                         endpoint::HTTP.URI = lol_replay_server(),
                         action::Function = http_action)
    data = call_api(action, HTTP.get, endpoint, "/replay/playback")
end

function replay_playback(playback ;
                         endpoint::HTTP.URI = lol_replay_server(),
                         action::Function = http_action)
    data = call_api(action, HTTP.post, endpoint, "/replay/playback", playback)
end

"""
         replay_render( ;
                       endpoint::HTTP.URI = lol_replay_server(),
                       action::Function = http_action)
"""
function replay_render( ;
                       endpoint::HTTP.URI = lol_replay_server(),
                       action::Function = http_action)
    data = call_api(action, HTTP.get, endpoint, "/replay/render")
end

function replay_render(render ;
                       endpoint::HTTP.URI = lol_replay_server(),
                       action::Function = http_action)
    data = call_api(action, HTTP.post, endpoint, "/replay/render", render)
end

"""
         replay_recording( ;
                          endpoint::HTTP.URI = lol_replay_server(),
                          action::Function = http_action)
"""
function replay_recording( ;
                          endpoint::HTTP.URI = lol_replay_server(),
                          action::Function = http_action)
    data = call_api(action, HTTP.get, endpoint, "/replay/recording")
end

function replay_recording(recording ;
                          endpoint::HTTP.URI = lol_replay_server(),
                          action::Function = http_action)
    data = call_api(action, HTTP.post, endpoint, "/replay/recording", recording)
end

"""
         replay_sequence( ;
                         endpoint::HTTP.URI = lol_replay_server(),
                         action::Function = http_action)
"""
function replay_sequence( ;
                         endpoint::HTTP.URI = lol_replay_server(),
                         action::Function = http_action)
    data = call_api(action, HTTP.get, endpoint, "/replay/sequence")
end

function replay_sequence(sequence ;
                              endpoint::HTTP.URI = lol_replay_server(),
                              action::Function = http_action)
    data = call_api(action, HTTP.post, endpoint, "/replay/sequence", sequence)
end

"""
         swagger_v2_swagger( ;
                            endpoint::HTTP.URI = lol_replay_server(),
                            action::Function = http_action)
"""
function swagger_v2_swagger( ;
                            endpoint::HTTP.URI = lol_replay_server(),
                            action::Function = http_action)
    data = call_api(action, HTTP.get, endpoint, "/swagger/v2/swagger.json")
end

"""
         swagger_v3_openapi( ;
                            endpoint::HTTP.URI = lol_replay_server(),
                            action::Function = http_action)
"""
function swagger_v3_openapi( ;
                            endpoint::HTTP.URI = lol_replay_server(),
                            action::Function = http_action)
    data = call_api(action, HTTP.get, endpoint, "/swagger/v3/openapi.json")
end

end # module LOLTools.GameClient
