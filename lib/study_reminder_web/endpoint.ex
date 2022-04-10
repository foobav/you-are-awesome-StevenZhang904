defmodule StudyReminderWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :study_reminder

  socket "/socket", StudyReminderWeb.UserSocket,
    websocket: true,
    longpoll: false

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :study_reminder,
  