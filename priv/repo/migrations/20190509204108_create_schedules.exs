defmodule Atlantis.Repo.Migrations.CreateSchedules do
  use Ecto.Migration

  def change do
    create table(:schedules) do
      add :boat_id, :integer
      add :marine_id, :integer
      add :schedule_date, :utc_datetime
      add :observation, :string
      add :email, :string
      add :sailor_id, :integer

      timestamps()
    end

    create unique_index(:schedules, [:email])
  end
end
