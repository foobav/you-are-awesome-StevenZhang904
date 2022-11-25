defmodule StudyReminderWeb.UserControllerTest do
  use StudyReminderWeb.ConnCase

  alias StudyReminder.Accounts
  alias StudyReminder.Accounts.User


  @create_attrs %{email: "user@business.com", password: "some encrypted_password"}
  @invalid_attrs %{email: nil, password: nil}

  def fixture(:user) do
    {:ok, user} = Accounts.create_user(@create_attrs)
    user
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create user"