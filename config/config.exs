# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_composable,
  ecto_repos: [PhoenixComposable.Repo]

# Configures the endpoint
config :phoenix_composable, PhoenixComposableWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9/1JRsb5YjS/fiD+C9d1MoQzbUribQaumqOM4p1R7uh2YjRK1hjy3/S6G4XFjIBa",
  render_errors: [view: PhoenixComposableWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixComposable.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "2YFiut+g"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
