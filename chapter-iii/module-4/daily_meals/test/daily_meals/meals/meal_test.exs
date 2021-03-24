defmodule DailyMeals.Meals.MealTest do
  use DailyMeals.DataCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.Meals.Meal
  alias Ecto.Changeset

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:meal_params)

      response = Meal.changeset(params)

      assert %Changeset{
               changes: %{
                 descricao: "Sopa",
                 data: _data,
                 calorias: 20
               },
               valid?: true
             } = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = build(:meal_params, %{calorias: -1})

      response = Meal.changeset(params)

      expected_response = %{calorias: ["must be greater than or equal to 0"]}

      assert errors_on(response) == expected_response
    end
  end
end
