defmodule Atlantis.Repo.Migrations.CreateSchedules do
  use Ecto.Migration

  def change do
    create table(:schedules) do
      add :boat_id, references(:boats)
      add :marine_id, references(:marines)
      add :schedule_date, :utc_datetime
      add :observation, :string
      add :email, :string
      add :sailor_id, references(:sailors)

      timestamps()
    end

    create unique_index(:schedules, [:email])
  end
end
