module test_loltools_gameclient_replay

using Test
using LOLTools.GameClient
using HTTP, Bukdu

function mock_action(verb, endpoint, path, headers=[], query=nothing)
    if query !== nothing
        path = string(merge(HTTP.URI(path), query=query))
    end
    if verb === HTTP.post
        bukdu_verb = post
    else
        bukdu_verb = get
    end
    Router.call(bukdu_verb, path, headers).resp
end

struct ReplayController <: ApplicationController
    conn::Conn
end

function replay_game(c::ReplayController)
    render(JSON, (processID = 2544,))
end

function replay_playback(c::ReplayController)
    render(JSON, (a=1,))
end

function replay_playback_post(c::ReplayController)
    render(JSON, (a=1,))
end

function replay_render(c::ReplayController)
    render(JSON, (a=1,))
end

function replay_render_post(c::ReplayController)
    render(JSON, (a=1,))
end

function replay_recording(c::ReplayController)
    render(JSON, (a=1,))
end

function replay_recording_post(c::ReplayController)
    render(JSON, (a=1,))
end

function replay_sequence(c::ReplayController)
    render(JSON, (a=1,))
end

function replay_sequence_post(c::ReplayController)
    render(JSON, (a=1,))
end

function swagger_v2_swagger(c::ReplayController)
    render(JSON, (a=1,))
end

function swagger_v3_openapi(c::ReplayController)
    render(JSON, (a=1,))
end

routes() do
    get("/replay/game", ReplayController, replay_game)
    get("/replay/playback", ReplayController, replay_playback)
    get("/replay/render", ReplayController, replay_render)
    get("/replay/recording", ReplayController, replay_recording)
    get("/replay/sequence", ReplayController, replay_sequence)
    get("/swagger/v2/swagger.json", ReplayController, swagger_v2_swagger)
    get("/swagger/v3/openapi.json", ReplayController, swagger_v3_openapi)
    post("/replay/playback", ReplayController, replay_playback_post)
    post("/replay/render", ReplayController, replay_render_post)
    post("/replay/recording", ReplayController, replay_recording_post)
    post("/replay/sequence", ReplayController, replay_sequence_post)
end

@test (processID = 2544,) == GameClient.replay_game(; action=mock_action)
GameClient.replay_playback(; action=mock_action)
GameClient.replay_playback_post(; action=mock_action)
GameClient.replay_render(; action=mock_action)
GameClient.replay_render_post(; action=mock_action)
GameClient.replay_recording(; action=mock_action)
GameClient.replay_recording_post(; action=mock_action)
GameClient.replay_sequence(; action=mock_action)
GameClient.replay_sequence_post(; action=mock_action)
GameClient.swagger_v2_swagger(; action=mock_action)
GameClient.swagger_v3_openapi(; action=mock_action)

end # modu test_loltools_gameclient_replay
