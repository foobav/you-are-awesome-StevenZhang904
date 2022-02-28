defmodule StudyReminderWeb.Authentication.ErrorHandler do
    import Plug.Conn
  
    def auth_error(conn, {type, _reason}, _opts) do
      body = Poison.encode!(%{error: to_string(type)})
      con