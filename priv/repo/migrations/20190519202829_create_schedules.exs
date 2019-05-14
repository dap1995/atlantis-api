defmodule Atlantis.Repo.Migrations.CreateSchedules do
  use Ecto.Migration

  def change do
    create table(:schedules) do
      add :email, :string
      add :start_date, :utc_datetime
      add :observation, :string
      add :owner_id, references(:users, on_delete: :nothing)
      add :marine_id, references(:marines, on_delete: :nothing)
      add :boat_id, references(:boats, on_delete: :nothing)
      add :sailor_id, references(:sailors, on_delete: :nothing)

      timestamps()
    end

    create index(:schedules, [:owner_id])
    create index(:schedules, [:marine_id])
    create index(:schedules, [:boat_id])
    create index(:schedules, [:sailor_id])
  end
end
