defmodule StudyReminderWeb.Authentication.Guardian do
    use Guardian, otp_app: :study_reminder
  
    alias StudyReminder.Accounts
  
    def subject_for_token(user, _claims) do
      sub = to_string(user.id)
      {:ok, sub}
    end
  
    def resource_from_claims(claims) do
      id = claims["sub"]
      resource = Accounts.get_user!(id)
      {:ok,  resource