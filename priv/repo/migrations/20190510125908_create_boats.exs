defmodule Atlantis.Repo.Migrations.CreateBoats do
  use Ecto.Migration

  def change do
    create table(:boats) do
      add :name, :string
      add :owner_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:boats, [:owner_id])
  end
end
