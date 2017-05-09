use Mix.Config

config :blog, Blog.Endpoint,
  # the PORT env variable will be set by Gatling in the
  # init script of the service that (re)starts the app
  http: [port: {:system, "PORT"}],
  url: [scheme: "http", host: "ryantablada.com", port: 80],
  cache_static_manifest: "priv/static/manifest.json",
  # configuration for the Distillery release
  root: ".",
  server: true,
  version: Mix.Project.config[:version]

config :my_app, Blog.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY_BASE")

config :my_app, Blog.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("DB_USERNAME"),
  password: System.get_env("DB_PASSWORD"),
  database: System.get_env("DB_DATABASE"),
  hostname: System.get_env("DB_HOSTNAME"),
  pool_size: 20

# This line appears further down. Do not forget to uncomment it!
config :phoenix, :serve_endpoints, true

# Remove the prod secret import as we configure via environment variables
# import_config "prod.secret.exs"
