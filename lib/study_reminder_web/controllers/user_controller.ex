defmodule StudyReminderWeb.UserController do
  use StudyReminderWeb, :controller

  alias StudyReminder.Accounts
  alias StudyReminder.Accounts.User
  alias StudyReminderWeb.Authentication.Guardian


  action_fallbac