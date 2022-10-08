defmodule StudyReminder.AccountsTest do
  use StudyReminder.DataCase

  alias StudyReminder.Accounts

  describe "users" do
    alias StudyReminder.Accounts.User

    @valid_attrs %{email: "user@business.com", password: "some password"}
    @update_attrs %{email: "user2@business.c