defmodule Flightex.Users.CreateTest do
  use ExUnit.Case

  alias Flightex.Users.Agent, as: UserAgent
  alias Flightex.Users.Create

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "Raul",
        email: "raul@mail.com",
        cpf: "65977019092"
      }

      response = Create.call(params)

      assert {:ok, _user_id} = response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Raul",
        email: "raul@mail.com",
        cpf: 65_977_019_092
      }

      response = Create.call(params)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
