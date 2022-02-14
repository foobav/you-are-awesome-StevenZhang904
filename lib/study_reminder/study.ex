defmodule StudyReminder.Study do
  @moduledoc """
  The Study context.
  """

  import Ecto.Query, warn: false
  alias StudyReminder.Repo

  alias StudyReminder.Study.Reminder

  @doc """
  Returns the list of reminders.

  ## Examples

      iex> list_reminders()
      [%Reminder{}, ...]

  """
  def list_reminders do
    Repo.all(Reminder)
  end

  @doc """
  Gets a single reminder.

  Raises `Ecto.NoResultsError` if the Reminder does not exist.

  ## Examples

      iex> get_reminder!(123)
      %Reminder{}

      iex> get_reminde