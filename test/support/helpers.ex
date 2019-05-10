defmodule Atlantis.Helpers do
  use Phoenix.ConnTest
  import Atlantis.Factory

  def sign_in(conn) do
    user = insert(:user)
    {:ok, token, claims} = Atlantis.Guardian.encode_and_sign(user)
    conn = conn
      |> put_req_header("authorization", "Bearer #{token}")
    conn
  end
end