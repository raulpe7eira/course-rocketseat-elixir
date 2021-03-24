defmodule DailyMealsWeb.MealsViewTest do
  use DailyMealsWeb.ConnCase, async: true

  import DailyMeals.Factory
  import Phoenix.View

  alias DailyMealsWeb.MealsView

  test "renders create.json" do
    meal = build(:meal)

    response = render(MealsView, "create.json", meal: meal)

    assert %{
              message: "Meal created!",
              detail: %{
                meal: %DailyMeals.Meals.Meal{
                  id: "27d34263-6b3f-4236-a2a1-3949c3804b93",
                  descricao: "Sopa",
                  data: "2021-03-24T18:00:00Z",
                  calorias: 20,
                  inserted_at: nil,
                  updated_at: nil
                }
              }
            } == response
  end
end
