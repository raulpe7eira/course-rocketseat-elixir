defmodule DailyMeals do
  alias DailyMeals.Meals.Create, as: CreateMeal

  defdelegate create_meal(params), to: CreateMeal, as: :call
end
