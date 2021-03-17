defmodule Flightex.Users.UserTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Users.User

  describe "build/3" do
    test "when all params are valid, returns the user" do
      response = User.build("Raul", "raul@mail.com", "65977019092")

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when there are invalid cpf, returns an error" do
      response = User.build("Raul", "raul@mail.com", 65_977_019_092)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
