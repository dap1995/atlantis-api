defmodule Atlantis.Business.Boat do
  use Ecto.Schema
  import Ecto.Changeset

  schema "boats" do
    field :name, :string

    belongs_to :schedule, Atlantis.Business.Schedule
    
    timestamps()
  end

  @doc false
  def changeset(boat, attrs) do
    boat
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
