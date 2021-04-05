# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the github client
config :codex, Codex.Repos.Retrieve, github_adapter: Codex.Github.Client

# Configures the endpoint
config :codex, CodexWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9eSnMMeRIx+8nXnC3LkelxrNVImfEp4sF0D48FX6tkIt+n/d5Rne0u6WWlHh4shj",
  render_errors: [view: CodexWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Codex.PubSub,
  live_view: [signing_salt: "xdCisLqF"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
