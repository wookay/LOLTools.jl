# skip

using Bukdu

function mock_action(endpoint, path, headers=[], query=nothing)
    if query !== nothing
        path = string(merge(HTTP.URI(path), query=query))
    end
    Router.call(get, path, headers).resp
end

merge!(Plug.Loggers.config, Dict(:action_pad => 25, :path_pad => 50))
