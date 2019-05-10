defmodule Atlantis.Repo.Migrations.CreateSchedules do
  use Ecto.Migration

  def change do
    create table(:schedules) do
      add :email, :string
      add :schedule_date, :utc_datetime
      add :observation, :string
      add :owner_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:schedules, [:email])
    create index(:schedules, [:owner_id])
  end
end
