defmodule Flightex.Users.UserTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Users.User

  describe "build/4" do
    setup do
      {:ok, id: UUID.uuid4()}
    end

    test "when all params are valid, returns the user", %{id: id} do
      response = User.build(id, "Raul", "raul@mail.com", "65977019092")

      expected_response = {:ok, build(:user, id: id)}

      assert response == expected_response
    end

    test "when there are invalid id, returns an error" do
      response = User.build("", "Raul", "raul@mail.com", "65977019092")

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "when there are invalid cpf, returns an error", %{id: id} do
      response = User.build(id, "Raul", "raul@mail.com", 65_977_019_092)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
