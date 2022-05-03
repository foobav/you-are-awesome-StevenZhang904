defmodule StudyReminderWeb.ReminderView do
  use StudyReminderWeb, :view
  alias StudyReminderWeb.ReminderView

  def render("index.json", %{reminders: reminders}) do
    %{data: render_many(reminders, ReminderView, "reminder.json")}
  end

  def render("show.json", %{reminder: reminder}) do
    %{data: render_one(reminder, ReminderView, "reminder.json")}
  end

  def render("reminder.json", %{reminder: reminder}) do
    %{id: reminder.id,
      name: reminder.name,
      reminder_enabled: reminder.reminder_enabled}
  end
end
