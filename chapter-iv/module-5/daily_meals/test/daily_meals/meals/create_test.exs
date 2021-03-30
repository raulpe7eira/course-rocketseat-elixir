defmodule DailyMeals.Meals.CreateTest do
  use DailyMeals.DataCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.Meals.{Create, Meal}

  @create_params build(:meal_params)
  @invalid_params build(:meal_params, descricao: nil, data: nil, calorias: nil)

  describe "call/2" do
    test "when all params are valid, returns the meal" do
      user = insert(:user)

      response = Create.call(user.id, @create_params)

      assert {:ok,
              %Meal{
                id: _id,
                descricao: "Sopa",
                data: ~N[2021-03-24 18:00:00],
                calorias: 20
              }} = response
    end

    test "when there are invalid params, returns an error" do
      user = insert(:user)

      response = Create.call(user.id, @invalid_params)

      expected_response = %{
        descricao: ["can't be blank"],
        data: ["can't be blank"],
        calorias: ["can't be blank"]
      }

      assert {:error, changeset} = response
      assert expected_response == errors_on(changeset)
    end
  end
end
