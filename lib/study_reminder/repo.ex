defmodule StudyReminder.Repo do
  use Ecto.Repo,
    otp_app: :study_reminder,
    adapter: Ecto.Adapters.Postgres
end
