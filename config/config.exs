# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :atlantis,
  ecto_repos: [Atlantis.Repo]

# Configures the endpoint
config :atlantis, AtlantisWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SnJzrcLI9EKYZWi3bw0IRA2eumZXs5m1ZUckdWi7PkNHFYUdFOqnrdF2tLl2AobP",
  render_errors: [view: AtlantisWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Atlantis.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Guardian config
config :atlantis, Atlantis.Guardian,
  issuer: "atlantis",
  secret_key: "ycdxPBzzwGsZvTfpAvMJCGwgx1Xwsc80GZLNUo6ydBuLZCUPaBzD9YxjpM1YGfCD"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
