defmodule Atlantis.Repo.Migrations.CreateBoats do
  use Ecto.Migration

  def change do
    create table(:boats) do
      add :name, :string
      add :schedule_id, references(:schedules, on_delete: :nothing)
      add :owner_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:boats, [:schedule_id])
    create index(:boats, [:owner_id])
  end
end
