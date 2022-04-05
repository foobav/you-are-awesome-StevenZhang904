defmodule StudyReminderWeb.UserController do
  use StudyReminderWeb, :controller

  alias StudyReminder.Accounts
  alias StudyReminder.Accounts.User
  alias StudyReminderWeb.Authentication.Guardian


  action_fallback StudyReminderWeb.FallbackController

  def create(conn, user_params) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params),
      {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
        conn
        |> put_status(:created)
        |> render("user.json", %{user: user, token: token})
    end
  end

  def signin(conn, %{"email" => email, "password" => password}) do
    with {:ok, user, token} <- Guardian.authenticate(email, password) do
      conn
      |> put_status(:created)
      |> render("user.json", %{user: user, token: token})
    end
  end

end
