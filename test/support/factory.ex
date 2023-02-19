
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
  
    def build(factory, context, attributes) when is_atom(factory) and is_map(context) do
      context |> entity(factory) |> filter_overridden(attributes) |> struct(attributes)
    end

    def insert(factory), do: insert(factory, %{}, [])
    def insert(factory, context: %{} = context), do: insert(factory, context, [])
    def insert(factory, attributes), do: insert(factory, %{}, attributes)
  
    def insert(factory, context, attributes) when is_atom(factory) and is_map(context) do
      Repo.insert!(build(factory, context, attributes))
    end



    #
    # Entities build nested sub-entities by default.
    # However, the developer may override some of these sub-entities by setting
    # an association via foreign key. This function discards the pre-generated
    # entities in case an override is set.
    #
    # e.g.: Drop a generated 'patient' if an explicit 'patient_id' was passed
    #
    defp filter_overridden(entity, attributes) do
        to_drop =
        Enum.reduce(attributes, [], fn {identifier, _value}, acc ->
            string_identifier = "#{identifier}"

            with true <- String.ends_with?(string_identifier, "_id"),
                raw <-
                string_identifier
                |> String.replace_suffix("_id", "")
                |> String.to_atom(),
                true <- Map.has_key?(entity, raw) do
            [raw | acc]
            else
            _ -> acc
            end
        end)

        Map.drop(entity, to_drop)
    end
end