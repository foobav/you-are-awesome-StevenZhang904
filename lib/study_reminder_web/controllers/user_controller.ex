defmodule StudyReminderWeb.UserController do
  use StudyReminderWeb, :controller

  alias StudyReminder.Accounts
  alias StudyReminder.Accounts.User
  alias StudyReminderWeb.Authentication.Guardian


  action_fallback StudyReminderWeb.FallbackController

  def create(conn, user_params) do
    with {:ok