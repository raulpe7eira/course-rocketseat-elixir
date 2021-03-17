defmodule Flightex.Bookings.CreateTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Bookings.Create
  alias Flightex.Users.Agent, as: UserAgent

  describe "call/2" do
    setup do
      Flightex.start_agents()

      {:ok, user_id} =
        :user
        |> build()
        |> UserAgent.save()

      {:ok, user_id: user_id}
    end

    test "when all params are valid, saves the booking", %{user_id: user_id} do
      params = %{
        data_completa: "2021-03-17T11:00:00.000Z",
        cidade_origem: "Rio de Janeiro",
        cidade_destino: "São Paulo"
      }

      response = Create.call(user_id, params)

      assert {:ok, _uuid} = response
    end

    test "when there is no user with given user_id, returns an error" do
      params = %{
        data_completa: "2021-03-17T11:00:00.000Z",
        cidade_origem: "Rio de Janeiro",
        cidade_destino: "São Paulo"
      }

      response = Create.call("non-user-id", params)

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
