defmodule Atlantis.Business.Schedule do
  use Ecto.Schema
  import Ecto.Changeset

  schema "schedules" do
    field :boat_id, :integer
    field :email, :string
    field :marine_id, :integer
    field :observation, :string
    field :sailor_id, :integer
    field :schedule_date, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(schedule, attrs) do
    schedule
    |> cast(attrs, [:boat_id, :marine_id, :schedule_date, :observation, :email, :sailor_id])
    |> validate_required([:boat_id, :marine_id, :schedule_date, :observation, :email, :sailor_id])
    |> unique_constraint(:email)
  end
end
