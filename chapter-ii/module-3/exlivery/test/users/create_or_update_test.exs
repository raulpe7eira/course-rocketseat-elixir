defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "Raul",
        address: "Rua sem fim",
        email: "raul@mail.com",
        cpf: "65977019092",
        age: 40
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created and updated successfully"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Raul",
        address: "Rua sem fim",
        email: "raul@mail.com",
        cpf: "65977019092",
        age: 5
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
