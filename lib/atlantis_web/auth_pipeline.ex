defmodule Atlantis.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :atlantis,
  module: Atlantis.Guardian,
  error_handler: Atlantis.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end