# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :foreign_key,
  ecto_repos: [ForeignKey.Repo]

# Configures the endpoint
config :foreign_key, ForeignKey.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "U04o4RF8OfFrVOmiJR+8yt6LgjiqHXnofLtsuQiE5oprtCnni4qhw1wWOjZQrmAm",
  render_errors: [view: ForeignKey.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ForeignKey.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
