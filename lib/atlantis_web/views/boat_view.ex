defmodule AtlantisWeb.BoatView do
  use AtlantisWeb, :view
  alias AtlantisWeb.BoatView

  def render("index.json", %{boats: boats}) do
    %{data: render_many(boats, BoatView, "boat.json")}
  end

  def render("show.json", %{boat: boat}) do
    %{data: render_one(boat, BoatView, "boat.json")}
  end

  def render("boat.json", %{boat: boat}) do
    %{id: boat.id,
      name: boat.name}
  end
end
