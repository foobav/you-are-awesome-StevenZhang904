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
    Repo.al