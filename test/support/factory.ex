
defmodule StudyReminder.Factory do
    @moduledoc """
        Module responsible to provide helper functions for entity creations on tests
    """

    alias StudyReminderWeb.Authentication
    alias StudyReminder.Repo

    def jwt_account_token do
        user = insert(:user)
        # account = insert(:account, context: %{user: user})
        {:ok, jwt_account_token, _} = Authentication.Guardian.encode_and_sign(user)
        jwt_account_token
    end

    def jwt_account_token(%{user: %StudyReminder.Accounts.User{} = user}) do
        {:ok, jwt_account_token, _} = Authentication.Guardian.encode_and_sign(user)
        jwt_account_token
    end


    defp entity(_context, :user) do
        %StudyReminder.Accounts.User{
            email: Faker.Internet.email(),
            encrypted_password: Faker.String.base64()
        }
    end

    # defp entity(context, :account) do
    # %Bank.Account{
    #     name: Faker.Name.name(),
    #     user: get_assoc(context, :user)
    # }
    # end

    def build(factory), do: build(factory, %{}, [])
    def build(factory, context: %{} = context), do: build(factory, context, [])
    def build(factory, attributes), do: build(factory, %{}, attributes)