defmodule Atlantis.Repo.Migrations.CreateSailors do
  use Ecto.Migration

  def change do
    create table(:sailors) do
      add :name, :string

      timestamps()
    end

  end
end
