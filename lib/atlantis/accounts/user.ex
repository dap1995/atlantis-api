defmodule Atlantis.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    has_many :boats, Atlantis.Business.Boat, foreign_key: :owner_id
    has_many :marines, Atlantis.Business.Marine, foreign_key: :owner_id
    has_many :sailors, Atlantis.Business.Sailor, foreign_key: :owner_id
    has_many :schedules, Atlantis.Business.Schedule, foreign_key: :owner_id
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :password_confirmation]) # Remove hash, add pw + pw confirmation
    |> validate_required([:email, :password, :password_confirmation]) # Remove hash, add pw + pw confirmation
    |> validate_format(:email, ~r/@/) # Check that email is valid
    |> validate_length(:password, min: 8) # Check that password length is >= 8 
    |> validate_confirmation(:password) # Check that password === password_confirmation
    |> unique_constraint(:email)
    |> put_password_hash # Add put_password_hash to changeset pipeline
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}}
        ->
          put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
          changeset
    end
  end
end
