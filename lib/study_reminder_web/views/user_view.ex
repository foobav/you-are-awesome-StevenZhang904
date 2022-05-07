defmodule StudyReminderWeb.UserView do
  use StudyReminderWeb, :view
  alias StudyReminderWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user, token: token}) do
    %{
      email: user.email,
      token: token,
    }
  end
end
