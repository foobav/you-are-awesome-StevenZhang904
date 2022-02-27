defmodule StudyReminderWeb.Authentication.ErrorHandler do
    import Plug.Conn
  
    def auth_error(conn, {type, _r