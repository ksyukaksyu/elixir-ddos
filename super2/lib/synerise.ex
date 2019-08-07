defmodule Synerise do
  def send, do: exit(:slishkom_mnogo_zaprosov)

  def run do
    run()
  end

  def listen do
    receive do
      {:ok, "hello"} -> IO.puts("World")
    end
    listen
  end
  
end
