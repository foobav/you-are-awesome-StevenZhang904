
defmodule StudyReminder.Repo.Migrations.CreateReminders do
  use Ecto.Migration

  def change do
    create table(:reminders) do
      add :name, :string
      add :reminder_enabled, :boolean, default: false, null: false

      timestamps()
    end

  end
end