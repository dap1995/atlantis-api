defmodule Atlantis.AccountsTest do
  use Atlantis.DataCase

  alias Atlantis.Accounts

  describe "users" do
    alias Atlantis.Accounts.User

    @valid_attrs %{
      email: "email@email.com",
      password: "some password",
      password_confirmation: "some password"
    }
    @update_attrs %{
      email: "newemail@email.com",
      password: "some password",
      password_confirmation: "some password"
    }
    @invalid_attrs %{email: nil, password_hash: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      user_from_database = Accounts.get_user!(user.id)
      assert user_from_database.email == user.email
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "email@email.com"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.email == "newemail@email.com"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      user_from_database = Accounts.get_user!(user.id)
      assert user.email == user_from_database.email
      assert user.password_hash == user_from_database.password_hash
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
