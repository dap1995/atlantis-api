defmodule Atlantis.Business.Marine do
  use Ecto.Schema
  import Ecto.Changeset

  schema "marines" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(marine, attrs) do
    marine
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
