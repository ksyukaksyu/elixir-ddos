defmodule Super.Server do
  use GenServer
  require Logger

  def start_link do
    GenServer.start_link(__MODULE__, nil, [name: __MODULE__])
  end

  def init(_) do
    # run timeout to die
    spawn(__MODULE__, :live, [])

    # start web-server
    children = [
      Plug.Adapters.Cowboy.child_spec(
        :http,
        Super.Server.Router,
        [],
        port: 8080
      )
    ]

    Logger.info("[SERVER] Started")
    Supervisor.start_link(children, strategy: :rest_for_one)
  end

  def live do
    :timer.sleep(180000)
    Logger.info("[SERVER] DIE after #{Super.Server.Router.counter()} requests (^>_<^)")
    Process.exit(Process.whereis(__MODULE__), :shutdown)
  end
end