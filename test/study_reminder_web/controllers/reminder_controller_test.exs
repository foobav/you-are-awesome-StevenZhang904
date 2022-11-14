defmodule StudyReminderWeb.ReminderControllerTest do
  use StudyReminderWeb.ConnCase

  import StudyReminder.Factory

  alias StudyReminder.Study
  alias StudyReminder.Study.Reminder

  @invalid_attrs %{name: nil, reminder_enabled: nil}

  @create_attrs %{
    name: "some name",
    reminder_enabled: true
  }

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "applica