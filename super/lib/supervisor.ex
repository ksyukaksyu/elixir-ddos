defmodule Super.Supervisor do
  use Supervisor
  require Logger

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    children = [
      worker(Super.Server, [], restart: :temporary),
      worker(Super.Client, [], restart: :temporary)
    ]
    supervise(children, strategy: :rest_for_one)
  end
end