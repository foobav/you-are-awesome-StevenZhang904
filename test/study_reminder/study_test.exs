
defmodule StudyReminder.StudyTest do
  use StudyReminder.DataCase

  import StudyReminder.Factory
  
  alias StudyReminder.Study

  describe "reminders" do
    alias StudyReminder.Study.Reminder

    @valid_attrs %{name: "some name", reminder_enabled: true}
    @update_attrs %{name: "some updated name", reminder_enabled: false}
    @invalid_attrs %{name: nil, reminder_enabled: nil}

    def reminder_fixture(attrs \\ %{}) do
      {:ok, reminder} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Study.create_reminder()

      reminder
    end

    test "create_reminder/1 with valid data creates a reminder" do
      user = insert(:user)
      assert {:ok, %Reminder{} = reminder} = Study.create_reminder(user, @valid_attrs)
      assert reminder.name == "some name"
      assert reminder.reminder_enabled == true
    end
  end
end