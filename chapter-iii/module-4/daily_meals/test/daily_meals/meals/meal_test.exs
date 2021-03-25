defmodule DailyMeals.Meals.MealTest do
  use DailyMeals.DataCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.Meals.Meal
  alias Ecto.Changeset

  @create_params build(:meal_params)
  @update_params build(:meal_params, descricao: "Ovo", data: ~N[2021-03-24 17:00:00], calorias: 1)
  @invalid_params build(:meal_params, descricao: nil, data: nil, calorias: nil)

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      response = Meal.changeset(@create_params)

      assert %Changeset{
               changes: %{
                 descricao: "Sopa",
                 data: ~N[2021-03-24 18:00:00],
                 calorias: 20
               },
               errors: [],
               data: %DailyMeals.Meals.Meal{},
               valid?: true
             } = response
    end

    test "when there are some error, returns an invalid changeset" do
      response = Meal.changeset(@invalid_params)

      expected_response = %{
        descricao: ["can't be blank"],
        data: ["can't be blank"],
        calorias: ["can't be blank"]
      }

      assert expected_response == errors_on(response)
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      response =
        @create_params
        |> Meal.changeset()
        |> Meal.changeset(@update_params)

      assert %Changeset{
               changes: %{
                 descricao: "Ovo",
                 data: ~N[2021-03-24 17:00:00],
                 calorias: 1
               },
               errors: [],
               data: %DailyMeals.Meals.Meal{},
               valid?: true
             } = response
    end
  end
end
