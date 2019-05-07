defmodule Atlantis.Repo do
  use Ecto.Repo,
    otp_app: :atlantis,
    adapter: Ecto.Adapters.Postgres
end
