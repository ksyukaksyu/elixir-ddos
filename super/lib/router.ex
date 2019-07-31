defmodule Super.Server.Router do
  use Plug.Router
  use Plug.Debugger
  require Logger

  def init(_) do
    Agent.start_link(fn -> 0 end, name: __MODULE__)
  end

  def count do
    Agent.update(__MODULE__, &(&1 + 1))
  end

  def counter do
    Agent.get(__MODULE__, & &1) 
  end

  plug(:match)
  plug(:dispatch)

  get "/who_am_i" do
    count()
    send_resp(conn, 200, "OK")
  end

  get "/:name/who_am_i" do
    # Logger.info("[SERVER] Request -> Response: Имя #{name}")
    count()
    send_resp(conn, 200, name)
  end

  match _ do
    Logger.info("[SERVER] Request -> 404")
    count()
  end

end
