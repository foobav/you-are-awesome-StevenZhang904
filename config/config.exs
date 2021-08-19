# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :study_reminder,
  ecto_repos: [StudyReminder.Repo]

# Configures the endpoint
config :study_reminder, StudyReminderWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+jkIoDa33F3mJA8lmVPCMT4pUpnSrJ6H2mzD9CZDZWe/D