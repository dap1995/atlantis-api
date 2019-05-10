defmodule Atlantis.Business.Marine do
  use Ecto.Schema
  import Ecto.Changeset

  schema "marines" do
    field :name, :string

    belongs_to :owner, Atlantis.Accounts.User
    belongs_to :schedule, Atlantis.Business.Schedule
    timestamps()
  end

  @doc false
  def changeset(marine, attrs) do
    marine
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
