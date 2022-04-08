defmodule StudyReminderWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :study_reminder

  socket "/socket", StudyReminderWeb.UserSo