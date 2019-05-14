defmodule AtlantisWeb.MarineView do
  use AtlantisWeb, :view
  alias AtlantisWeb.MarineView

  def render("index.json", %{marines: marines}) do
    %{data: render_many(marines, MarineView, "marine.json")}
  end

  def render("show.json", %{marine: marine}) do
    %{data: render_one(marine, MarineView, "marine.json")}
  end

  def render("marine.json", %{marine: marine}) do
    %{
      id: marine.id,
      name: marine.name,
      owner_id: marine.owner_id
    }
  end
end
