defmodule StudyReminderWeb.Router do
  use StudyReminderWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug StudyRem