defmodule Atlantis.Repo.Migrations.CreateSailors do
  use Ecto.Migration

  def change do
    create table(:sailors) do
      add :name, :string
      add :owner_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:sailors, [:owner_id])
  end
end
