defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Users.Agent, as: UserAgent

  describe "save/1" do
    test "saves the user" do
      UserAgent.start_link(%{})

      user = build(:user)

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      cpf = "43179920009"
      user = build(:user, cpf: cpf)

      UserAgent.save(user)

      {:ok, user: user, cpf: cpf}
    end

    test "when the user is found, returns the user", %{user: user, cpf: cpf} do
      response = UserAgent.get(cpf)

      expected_response = {:ok, user}

      assert response == expected_response
    end

    test "when the user is not found, returns an error" do
      response = UserAgent.get("non-user")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
