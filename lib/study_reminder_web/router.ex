defmodule StudyReminderWeb.Router do
  use StudyReminderWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug StudyReminderWeb.Authentication.Pipeline
  end

  scope "/api", StudyReminderWeb do
    pipe_through :api

    post "/users/signup", UserController, :create
    post "/users/signin", UserController, :signin
  end

  scope "/api", StudyReminderWeb do
    pipe_through 