defmodule DailyMeals.Users.CreateTest do
  use DailyMeals.DataCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.Users.{Create, User}

  @create_params build(:user_params)
  @invalid_params build(:user_params, nome: nil, cpf: nil, email: nil)

  describe "call/1" do
    test "when all params are valid, returns the user" do
      response = Create.call(@create_params)

      assert {:ok,
              %User{
                id: _id,
                nome: "Raul",
                cpf: "20445478055",
                email: "raul@mail.com"
              }} = response
    end

    test "when there are invalid params, returns an error" do
      response = Create.call(@invalid_params)

      expected_response = %{
        nome: ["can't be blank"],
        cpf: ["can't be blank"],
        email: ["can't be blank"]
      }

      assert {:error, changeset} = response
      assert expected_response == errors_on(changeset)
    end
  end
end
