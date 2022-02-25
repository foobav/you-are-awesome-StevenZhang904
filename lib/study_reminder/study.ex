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

      iex> get_reminder!(456)
      ** (Ecto.NoResultsError)

  """
  def get_reminder!(id), do: Repo.get!(Reminder, id)

  @doc """
  Creates a reminder.

  ## Examples

      iex> create_reminder(%{field: value})
      {:ok, %Reminder{}}

      iex> create_reminder(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_reminder(user, attrs \\ %{}) do
    %Reminder{}
    |> Reminder.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:user, user)
    |> Repo.insert()
  end

  @doc """
  Updates a reminder.

  ## Examples

      iex> update_reminder(reminder, %{field: new_value})
      {:ok, %Reminder{}}

      iex> update_reminder(reminder, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_reminder(user, %Reminder{} = reminder, attrs) do
    reminder
    |> Repo.preload(:user, force: true)
    |> Reminder.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:user, user)
    |> Repo.update()
  end

  @doc """
  Deletes a Reminder.

  ## Examples

      iex> delete_reminder(reminder)
      {:ok, %Reminder{}}

      iex> delete_reminder(reminder)
      {:error, %Ecto.Changeset{}}

  """
  def delete_reminder(%Reminder{} = reminder) do
    Repo.delete(reminder)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking reminder changes.

  ## Examples

      iex> change_reminder(reminder)
      %Ecto.Changeset{source: %Reminder{}}

  """
  def change_reminder(%Reminder{} = reminder) do
    Reminder.changeset(reminder, %{})
  end
end
