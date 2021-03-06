defmodule DailyMealsTest do
  use DailyMeals.DataCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.Meals.Meal

  test "creates meal" do
    params = build(:meal_params)

    response = DailyMeals.create_meal(params)

    assert {:ok,
            %Meal{
              id: _id,
              descricao: "Sopa",
              data: ~N[2021-03-24 18:00:00],
              calorias: 20,
              inserted_at: _inserted_at,
              updated_at: _updated_at
            }} = response
  end

  test "deletes meal" do
    meal = insert(:meal)

    response = DailyMeals.delete_meal(meal.id)

    assert {:ok,
            %Meal{
              id: "27d34263-6b3f-4236-a2a1-3949c3804b93",
              descricao: "Sopa",
              data: ~N[2021-03-24 18:00:00],
              calorias: 20,
              inserted_at: _inserted_at,
              updated_at: _updated_at
            }} = response
  end

  test "retrieves meal" do
    meal = insert(:meal)

    response = DailyMeals.retrieve_meal(meal.id)

    assert {:ok,
            %Meal{
              id: "27d34263-6b3f-4236-a2a1-3949c3804b93",
              descricao: "Sopa",
              data: ~N[2021-03-24 18:00:00],
              calorias: 20,
              inserted_at: _inserted_at,
              updated_at: _updated_at
            }} = response
  end

  test "updates meal" do
    meal = insert(:meal)
    params = build(:meal_params, descricao: "Ovo", data: ~N[2021-03-24 17:00:00], calorias: 1)

    response = DailyMeals.update_meal(meal.id, params)

    assert {:ok,
            %Meal{
              id: "27d34263-6b3f-4236-a2a1-3949c3804b93",
              descricao: "Ovo",
              data: ~N[2021-03-24 17:00:00],
              calorias: 1,
              inserted_at: _inserted_at,
              updated_at: _updated_at
            }} = response
  end
end
