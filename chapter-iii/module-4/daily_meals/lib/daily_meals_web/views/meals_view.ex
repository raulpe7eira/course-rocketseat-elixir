defmodule DailyMealsWeb.MealsView do
  use DailyMealsWeb, :view

  alias DailyMeals.Meals.Meal

  def render("create.json", %{meal: %Meal{} = meal}) do
    %{message: "Meal created!", detail: %{meal: meal}}
  end
end
