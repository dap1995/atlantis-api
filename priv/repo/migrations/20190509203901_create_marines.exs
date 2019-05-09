defmodule Atlantis.Repo.Migrations.CreateMarines do
  use Ecto.Migration

  def change do
    create table(:marines) do
      add :name, :string

      timestamps()
    end

  end
end
