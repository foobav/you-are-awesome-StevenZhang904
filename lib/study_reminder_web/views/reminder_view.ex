defmodule StudyReminderWeb.ReminderView do
  use StudyReminderWeb, :view
  alias StudyReminderWeb.ReminderView

  def render("index.json", %{reminders: reminders}) do
    %{data: render_many(reminders, ReminderView, "reminder.json")}
  end

  def render("show.json"