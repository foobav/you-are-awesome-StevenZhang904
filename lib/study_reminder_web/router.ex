defmodule StudyReminderWeb.Router do
  use StudyReminderWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug StudyReminderWeb.Authentication.Pipeline
  end

  scope "/api", StudyReminderWeb do
    pipe_t