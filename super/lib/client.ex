defmodule Super.Client do
  require Logger

  def start_link do
    GenServer.start_link(__MODULE__, nil, [name: __MODULE__])
  end

  def init(_) do
    spawn(__MODULE__, :request, [])
    Logger.info("[CLIENT] Started")

    {:ok, self()}
  end

  def request do
    url = "http://127.0.0.1:8080/me/who_am_i"

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        # Logger.info("[CLIENT] Request: OK; Response: #{body}")
        # :timer.sleep(1000)
        request()
      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.info("[CLIENT] Request: ERROR; Message: #{reason}; STOPPED!")
    end

    
  end
end