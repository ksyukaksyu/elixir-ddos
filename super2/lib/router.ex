defmodule Super.Router do
   use Plug.Router
   use Plug.Debugger

  plug(:match)
  plug(:dispatch)

  get "/who_am_i" do
    send_resp(conn, 200, "OK")
  end

  get "/:name/who_am_i" do
    IO.inspect("Имя #{name}")
    send_resp(conn, 200, name)
  end

  match _ do
    send_resp(conn, 404, "404 NF")
  end

end
