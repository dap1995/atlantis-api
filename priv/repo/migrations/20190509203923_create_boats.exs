defmodule Atlantis.Repo.Migrations.CreateBoats do
  use Ecto.Migration

  def change do
    create table(:boats) do
      add :name, :string

      timestamps()
    end

  end
end
