using LOLTools.GameClient
using .GameClient: lol_replay_server

endpoint = lol_replay_server(host="192.168.0.9")
game = GameClient.replay_game(; endpoint=endpoint)
@info :game game
# particles = GameClient.replay_particles(; endpoint=endpoint)
# @info :particles (keys(particles)[1:3], getfield.(Ref(particles), keys(particles)[1:3]))
playback = GameClient.replay_playback(; endpoint=endpoint)
@info :playback playback
render = GameClient.replay_render(; endpoint=endpoint)
@info :render render
recording = GameClient.replay_recording(; endpoint=endpoint)
@info :recording recording
sequence = GameClient.replay_sequence(; endpoint=endpoint)
@info :sequence sequence
v2 = GameClient.swagger_v2_swagger(; endpoint=endpoint)
v3 = GameClient.swagger_v3_openapi(; endpoint=endpoint)
@info :info v2.info == v3.info == (description = "League of Legends Game Client", title = "LoLClient", version = "1.0.0")
