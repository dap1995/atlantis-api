defmodule Atlantis.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: Atlantis.Repo

  def user_factory do
    %Atlantis.Accounts.User{
      password: "foobar123",
      password_confirmation: "foobar123",
      email: sequence(:email, &"email-#{&1}@example.com")
    }
  end

end