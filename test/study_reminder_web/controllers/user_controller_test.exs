defmodule StudyReminderWeb.UserControllerTest do
  use StudyReminderWeb.ConnCase

  alias StudyReminder.Accounts
  alias StudyReminder.Accounts.User


  @create_attrs %{email: "user@business.com", passw