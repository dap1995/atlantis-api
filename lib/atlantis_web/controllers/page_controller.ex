defmodule AtlantisWeb.PageController do
  use AtlantisWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
