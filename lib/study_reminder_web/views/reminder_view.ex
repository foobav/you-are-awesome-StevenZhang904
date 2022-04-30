defmodule StudyReminderWeb.ReminderView do
  use StudyReminderWeb, :view
  alias StudyReminderWeb.ReminderView

  def render("index.json", %{reminders: reminders}) do
