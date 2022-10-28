defmodule StudyReminder.AccountsTest do
  use StudyReminder.DataCase

  alias StudyReminder.Accounts

  describe "users" do
    alias StudyReminder.Accounts.User

    @valid_attrs %{email: "user@business.com", password: "some password"}
    @update_attrs %{email: "user2@business.com", password: "some updated password"}
    @invalid_attrs %{email: nil, password: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id).email == user.email
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "user@business.com"
      assert Comeonin.Bcrypt.checkpw("some password", user.encrypted_password) == true
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "user2@business.com"
      assert Comeonin.Bcrypt.checkpw("some updated password", user.encrypted_password) == true
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update