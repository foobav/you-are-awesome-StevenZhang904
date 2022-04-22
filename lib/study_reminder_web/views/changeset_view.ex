defmodule StudyReminderWeb.ChangesetView do
  use StudyReminderWeb, :view

  @doc """
  Traverses and translates changeset errors.

  See `Ecto.Changeset.traverse_errors/2` and
  `StudyReminderWeb.ErrorHelpers.translate_error/1` 