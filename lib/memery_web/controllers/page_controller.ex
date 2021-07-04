defmodule MemeryWeb.PageController do
  use MemeryWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
