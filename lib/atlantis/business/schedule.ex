defmodule Atlantis.Business.Schedule do
  use Ecto.Schema
  import Ecto.Changeset

  schema "schedules" do
    field :email, :string
    field :observation, :string
    field :schedule_date, :utc_datetime

    has_one :boat, Atlantis.Business.Boat
    has_one :marine, Atlantis.Business.Marine
    has_one :sailor, Atlantis.Business.Sailor
    belongs_to :owner, Atlantis.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(schedule, attrs) do
    schedule
    |> cast(attrs, [:email, :schedule_date, :observation])
    |> validate_required([:email, :schedule_date, :observation])
    |> unique_constraint(:email)
  end
end
