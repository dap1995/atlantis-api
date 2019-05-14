defmodule Atlantis.Business.Schedule do
  use Ecto.Schema
  import Ecto.Changeset

  schema "schedules" do
    field :email, :string
    field :observation, :string
    field :start_date, :utc_datetime
    belongs_to :owner, Atlantis.Accounts.User
    belongs_to :marine, Atlantis.Business.Marine
    belongs_to :boat, Atlantis.Business.Boat
    belongs_to :sailor, Atlantis.Business.Sailor

    timestamps()
  end

  @doc false
  def changeset(schedule, attrs) do
    schedule
    |> cast(attrs, [:email, :start_date, :observation, :owner_id, :marine_id, :boat_id])
    |> validate_required([:email, :start_date, :observation])
  end
end
