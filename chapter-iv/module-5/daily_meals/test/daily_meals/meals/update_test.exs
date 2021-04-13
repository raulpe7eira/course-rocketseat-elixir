defmodule DailyMeals.Meals.UpdateTest do
  use DailyMeals.DataCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.Meals.{Meal, Update}

  @update_params build(:meal_params, descricao: "Ovo", data: ~N[2021-03-24 17:00:00], calorias: 1)
  @invalid_params build(:meal_params, descricao: nil, data: nil, calorias: nil)

  describe "call/1" do
    test "when all params are valid, returns the meal" do
      meal = insert(:meal)

      response = Update.call(meal.id, @update_params)

      assert {:ok,
              %Meal{
                id: _id,
                descricao: "Ovo",
                data: ~N[2021-03-24 17:00:00],
                calorias: 1
              }} = response
    end

    test "when there are invalid params, returns an error" do
      meal = insert(:meal)

      response = Update.call(meal.id, @invalid_params)

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
