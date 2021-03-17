defmodule Flightex.Users.AgentTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Users.Agent, as: UserAgent

  describe "save/1" do
    test "saves the user" do
      UserAgent.start_link(%{})

      user = build(:user)

      assert {:ok, _user_id} = UserAgent.save(user)
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      user = build(:user)

      {:ok, id} = UserAgent.save(user)

      {:ok, user: %{user | id: id}}
    end

    test "when the user is found, returns the user", %{user: user} do
      response = UserAgent.get(user.id)

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
