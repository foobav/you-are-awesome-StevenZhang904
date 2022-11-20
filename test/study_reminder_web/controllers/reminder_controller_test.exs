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
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
    [jwt_account_token: jwt_account_token()]
  end

  describe "create reminder" do
    test "renders reminder when data is valid", %{conn: conn, jwt_account_token: jwt_account_token} do
      conn = conn |> put_req_header("authorization", "Bearer #{jwt_account_token}")
      conn = post(conn, Routes.reminder_path(conn, :create), reminder: @create_attrs)

      payload = json_response(conn, 201)
      
      assert payload["data"]["reminder_enabled"] == false
      assert payload["data"] |> Map.has_key?("name")
      assert payload["data"] |> Map.has_key?("id")
  
    end
  end
end
