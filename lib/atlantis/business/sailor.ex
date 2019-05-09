defmodule Atlantis.Business.Sailor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sailors" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(sailor, attrs) do
    sailor
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
