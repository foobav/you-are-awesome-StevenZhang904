
defmodule StudyReminderWeb.ReminderController do
  use StudyReminderWeb, :controller

  alias StudyReminder.Study
  alias StudyReminder.Study.Reminder

  action_fallback StudyReminderWeb.FallbackController

  def index(conn, _params) do
    reminders = Study.list_reminders()
    render(conn, "index.json", reminders: reminders)
  end

  def create(conn, reminder_params) do
    user = conn.assigns.current_user
    with {:ok, %Reminder{} = reminder} <- Study.create_reminder(user, reminder_params) do
      conn
      |> put_status(:created)
      |> render("show.json", reminder: reminder)
    end
  end

  def show(conn, %{"id" => id}) do
    reminder = Study.get_reminder!(id)
    render(conn, "show.json", reminder: reminder)
  end

  def update(conn, %{"id" => id, "reminder" => reminder_params}) do
    user = conn.assigns.current_user
    reminder = Study.get_reminder!(id)

    with {:ok, %Reminder{} = reminder} <- Study.update_reminder(user, reminder, reminder_params) do
      render(conn, "show.json", reminder: reminder)
    end
  end

  def delete(conn, %{"id" => id}) do
    reminder = Study.get_reminder!(id)

    with {:ok, %Reminder{}} <- Study.delete_reminder(reminder) do
      send_resp(conn, :no_content, "")
    end
  end
end