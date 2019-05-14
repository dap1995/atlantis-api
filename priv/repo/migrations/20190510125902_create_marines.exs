defmodule Atlantis.Repo.Migrations.CreateMarines do
  use Ecto.Migration

  def change do
    create table(:marines) do
      add :name, :string
      add :owner_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:marines, [:owner_id])
  end
end
