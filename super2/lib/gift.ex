defmodule Gift do
  def say(message) do
    IO.puts "[#{inspect self()}] Мне подарили: #{message}"
  end

  # iex()> spawn(Gift, :say, ["Lego"])
  # [#PID<0.396.0>] Мне подарили: Lego
  # #PID<0.396.0>

  def odds(list) do
    Enum.filter(list, fn item -> rem(item, 2) == 0 end)
  end

  # pid = spawn(fn -> :timer.sleep(60000) end)
  # Process.monitor(pid)
  # Process.exit(pid, :kill)
  # flush

end
