defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response = User.build("Raul", "Rua sem fim", "raul@mail.com", "65977019092", 40)

      expected_response =
        {:ok,
         %Exlivery.Users.User{
           address: "Rua sem fim",
           age: 40,
           cpf: "65977019092",
           email: "raul@mail.com",
           name: "Raul"
         }}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      response = User.build("Raul Jr", "Rua sem fim", "raul@mail.com", "65977019092", 15)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
