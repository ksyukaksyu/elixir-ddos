defmodule Super.Application do
  use Application
  require Logger

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Super.Supervisor, [])
    ]

    Logger.info("[APPLICATION] Started")

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
