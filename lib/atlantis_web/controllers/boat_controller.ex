defmodule AtlantisWeb.BoatController do
  use AtlantisWeb, :controller

  alias Atlantis.Business
  alias Atlantis.Business.Boat

  action_fallback AtlantisWeb.FallbackController

  def index(conn, _params) do
    boats = Business.list_boats()
    render(conn, "index.json", boats: boats)
  end

  def create(conn, %{"boat" => boat_params}) do
    with {:ok, %Boat{} = boat} <- Business.create_boat(boat_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.boat_path(conn, :show, boat))
      |> render("show.json", boat: boat)
    end
  end

  def show(conn, %{"id" => id}) do
    boat = Business.get_boat!(id)
    render(conn, "show.json", boat: boat)
  end

  def update(conn, %{"id" => id, "boat" => boat_params}) do
    boat = Business.get_boat!(id)

    with {:ok, %Boat{} = boat} <- Business.update_boat(boat, boat_params) do
      render(conn, "show.json", boat: boat)
    end
  end

  def delete(conn, %{"id" => id}) do
    boat = Business.get_boat!(id)

    with {:ok, %Boat{}} <- Business.delete_boat(boat) do
      send_resp(conn, :no_content, "")
    end
  end
end
