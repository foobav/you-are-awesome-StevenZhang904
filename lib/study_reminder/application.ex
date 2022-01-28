defmodule StudyReminder.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      StudyReminder.Repo,
      # Start the endpoint when the application starts
      StudyReminderWeb.Endpoint
      # Starts a w