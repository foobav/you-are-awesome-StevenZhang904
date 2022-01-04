use Mix.Config

# Configure your database
config :study_reminder, StudyReminder.Repo,
  username: "dev",
  password: "dev123",
  database: "study_reminder_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :study_reminder, StudyReminderWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
