defmodule DailyMeals.Users.UpdateTest do
  use DailyMeals.DataCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.Users.{Update, User}

  @update_params build(:user_params, nome: "Fulano", cpf: "47026165011", email: "fulano@mail.com")
  @invalid_params build(:user_params, nome: nil, cpf: nil, email: nil)

  describe "call/1" do
    test "when all params are valid, returns the user" do
      user = insert(:user)

      response = Update.call(user.id, @update_params)

      assert {:ok,
              %User{
                id: _id,
                nome: "Fulano",
                cpf: "47026165011",
                email: "fulano@mail.com"
              }} = response
    end

    test "when there are invalid params, returns an error" do
      user = insert(:user)

      response = Update.call(user.id, @invalid_params)

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
