# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :rummage_example,
  ecto_repos: [RummageExample.Repo]

# Configures the endpoint
config :rummage_example, RummageExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "EKehqJ4TqnlVQuz7fcZdCT2TE0V+kir1fLwO493QKvYGJyRhv2R9TyBRX1+EGtc3",
  render_errors: [view: RummageExampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RummageExample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
