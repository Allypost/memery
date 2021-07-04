# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :memery,
  ecto_repos: [Memery.Repo]

# Configures the endpoint
config :memery, MemeryWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4sWwMGQedVbqP1kbWgICo0MbikqcqEqSN2R6wlKSUDmU40X9oGwj1I8Lm3yVwMbq",
  render_errors: [view: MemeryWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Memery.PubSub,
  live_view: [signing_salt: "RiMiiOTe"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

if Mix.env() != :prod do
  config :git_hooks,
    verbose: true,
    hooks: [
      pre_commit: [
        tasks: [
          "mix clean",
          "mix compile --warnings-as-errors",
          "mix format --check-formatted",
          "mix credo --strict",
          "mix test"
        ]
      ]
    ]
end

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
