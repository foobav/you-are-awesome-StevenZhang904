defmodule StudyReminderWeb.Authentication.Pipeline do
    use Guardian.Plug.Pipeline, otp_app: :busi_api,
      module: StudyReminder