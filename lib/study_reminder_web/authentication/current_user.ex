defmodule StudyReminderWeb.Authentication.CurrentUser do
    @moduledoc """
    Load user from database by token and put on connection assigns
    """
    def init(_opts), do: :ok
  
    def call(conn, _opts) d