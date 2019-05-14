defmodule Atlantis.Business.Sailor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sailors" do
    field :name, :string

    belongs_to :owner, Atlantis.Accounts.User
    has_many :schedule, Atlantis.Business.Schedule
    timestamps()
  end

  @doc false
  def changeset(sailor, attrs) do
    sailor
    |> cast(attrs, [:name, :owner_id])
    |> validate_required([:name])
  end
end
