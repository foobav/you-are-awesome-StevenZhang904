defmodule StudyReminder.AccountsTest do
  use StudyReminder.DataCase

  alias StudyReminder.Accounts

  describe "users" do
    alias StudyReminder.Accounts.User

    @valid_attrs %{email: "user@bu