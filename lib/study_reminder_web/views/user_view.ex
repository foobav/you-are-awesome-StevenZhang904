defmodule StudyReminderWeb.UserView do
  use StudyReminderWeb, :view
  alias StudyReminderWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "u