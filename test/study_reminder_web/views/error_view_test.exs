defmodule StudyReminderWeb.ErrorViewTest do
  use StudyReminderWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.json" do
    assert render