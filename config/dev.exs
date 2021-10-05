use Mix.Config

# Configure your database
config :study_reminder, StudyReminder.Repo,
  username: "dev",
  password: "dev123",
  database: "study_reminder_dev",
  hostname: "localhost",
  show_sensitive_data_on_