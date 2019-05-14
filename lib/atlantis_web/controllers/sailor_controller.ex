defmodule AtlantisWeb.SailorController do
  use AtlantisWeb, :controller

  alias Atlantis.Business
  alias Atlantis.Business.Sailor

  action_fallback AtlantisWeb.FallbackController

  def index(conn, _params) do
    owner = Guardian.Plug.current_resource(conn)
    sailors = Business.list_sailors(owner.id)
    render(conn, "index.json", sailors: sailors)
  end

  def create(conn, %{"sailor" => sailor_params}) do
    owner = Guardian.Plug.current_resource(conn)
    sailor_params_with_owner = Map.put(sailor_params, "owner_id", owner.id)
    with {:ok, %Sailor{} = sailor} <- Business.create_sailor(sailor_params_with_owner) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.sailor_path(conn, :show, sailor))
      |> render("show.json", sailor: sailor)
    end
  end

  def show(conn, %{"id" => id}) do
    sailor = Business.get_sailor!(id)
    render(conn, "show.json", sailor: sailor)
  end

  def update(conn, %{"id" => id, "sailor" => sailor_params}) do
    sailor = Business.get_sailor!(id)

    with {:ok, %Sailor{} = sailor} <- Business.update_sailor(sailor, sailor_params) do
      render(conn, "show.json", sailor: sailor)
    end
  end

  def delete(conn, %{"id" => id}) do
    sailor = Business.get_sailor!(id)

    with {:ok, %Sailor{}} <- Business.delete_sailor(sailor) do
      send_resp(conn, :no_content, "")
    end
  end
end
