defmodule StudyReminderWeb.Authentication.Guardian do
    use Guardian, otp_app: :study_reminder
  
    alias StudyReminder.Accounts
  
    def subject_for_token(user, _claims) do
      sub = 