defmodule AtlantisWeb.MarineController do
  use AtlantisWeb, :controller

  alias Atlantis.Business
  alias Atlantis.Business.Marine

  action_fallback AtlantisWeb.FallbackController

  def index(conn, _params) do
    marines = Business.list_marines()
    render(conn, "index.json", marines: marines)
  end

  def create(conn, %{"marine" => marine_params}) do
    with {:ok, %Marine{} = marine} <- Business.create_marine(marine_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.marine_path(conn, :show, marine))
      |> render("show.json", marine: marine)
    end
  end

  def show(conn, %{"id" => id}) do
    marine = Business.get_marine!(id)
    render(conn, "show.json", marine: marine)
  end

  def update(conn, %{"id" => id, "marine" => marine_params}) do
    marine = Business.get_marine!(id)

    with {:ok, %Marine{} = marine} <- Business.update_marine(marine, marine_params) do
      render(conn, "show.json", marine: marine)
    end
  end

  def delete(conn, %{"id" => id}) do
    marine = Business.get_marine!(id)

    with {:ok, %Marine{}} <- Business.delete_marine(marine) do
      send_resp(conn, :no_content, "")
    end
  end
end
