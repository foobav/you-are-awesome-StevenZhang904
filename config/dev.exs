use Mix.Config

# Configure your database
config :study_reminder, StudyReminder.Repo,
  username: "dev",
  password: "dev123",
  database: "study_reminder_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with webpack to r