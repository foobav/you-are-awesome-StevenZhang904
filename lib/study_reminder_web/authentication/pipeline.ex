defmodule StudyReminderWeb.Authentication.Pipeline do
    use Guardian.Plug.Pipeline, otp_app: :busi_api,
      module: StudyReminderWeb.Authentication.Guardian,
      error_handler: StudyReminderWeb.Authentication.ErrorHandler
  
    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.EnsureAuthenticated
    plug Guardian.Plug.LoadResource
    plug StudyReminderWeb.Authentication.CurrentUser
  end