defmodule DailyMeals do
  alias DailyMeals.Meals.Create, as: CreateMeal
  alias DailyMeals.Meals.Retrieve, as: RetrieveMeal

  defdelegate create_meal(params), to: CreateMeal, as: :call
  defdelegate retrieve_meal_by_id(id), to: RetrieveMeal, as: :by_id
end
