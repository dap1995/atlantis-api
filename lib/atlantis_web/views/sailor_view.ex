defmodule AtlantisWeb.SailorView do
  use AtlantisWeb, :view
  alias AtlantisWeb.SailorView

  def render("index.json", %{sailors: sailors}) do
    %{data: render_many(sailors, SailorView, "sailor.json")}
  end

  def render("show.json", %{sailor: sailor}) do
    %{data: render_one(sailor, SailorView, "sailor.json")}
  end

  def render("sailor.json", %{sailor: sailor}) do
    %{
      id: sailor.id,
      name: sailor.name,
      owner_id: sailor.owner_id
    }
  end
end
