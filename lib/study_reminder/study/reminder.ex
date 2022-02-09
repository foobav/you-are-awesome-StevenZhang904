
defmodule StudyReminder.Study.Reminder do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reminders" do
    field :name, :string
    field :reminder_enabled, :boolean, default: false
    belongs_to :user, StudyReminder.Accounts.User, foreign_key: :user_id

    timestamps()
  end

  @doc false
  def changeset(reminder, attrs) do
    reminder
    |> cast(attrs, [:reminder_enabled, :name])
  end
end