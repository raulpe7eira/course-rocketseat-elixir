defmodule DailyMeals.Meals.CreateTest do
  use DailyMeals.DataCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.Meals.{Create, Meal}

  describe "call/1" do
    test "when all params are valid, returns the meal" do
      params = build(:meal_params)

      response = Create.call(params)

      assert {:ok, %Meal{id: _id, descricao: "Sopa", data: _data, calorias: 20}} = response
    end

    test "when there are invalid params, returns an error" do
      params = build(:meal_params, %{calorias: -1})

      response = Create.call(params)

      expected_response = %{calorias: ["must be greater than or equal to 0"]}

      assert {:error, changeset} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
