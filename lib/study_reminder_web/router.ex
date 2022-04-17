defmodule StudyReminderWeb.Router do
  use StudyReminderWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  