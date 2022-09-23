defmodule StudyReminder.Repo.Migrations.AddRemindersToUsers do
  use Ecto.Migration

  def change do
    alter table("reminders") do
      add :user_id, references(:users)
    end
  end
end
