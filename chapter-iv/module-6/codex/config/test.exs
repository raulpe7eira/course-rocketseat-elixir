use Mix.Config

# Configures the github client
config :codex, Codex.Repos.Retrieve, github_adapter: Codex.Github.ClientMock

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :codex, CodexWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
