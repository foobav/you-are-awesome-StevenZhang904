use Mix.Config

# Configure your database
config :study_reminder, StudyReminder.Repo,
  username: "dev",
  password: "dev123",
  database: "study_reminder_test",
  hostname: "localh