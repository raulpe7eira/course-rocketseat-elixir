defmodule DailyMeals do
  alias DailyMeals.Meals.Create, as: CreateMeal
  alias DailyMeals.Meals.Retrieve, as: RetrieveMeal
  alias DailyMeals.Meals.Update, as: UpdateMeal

  defdelegate create_meal(params), to: CreateMeal, as: :call
  defdelegate retrieve_meal_by_id(id), to: RetrieveMeal, as: :by_id
  defdelegate update_meal(params), to: UpdateMeal, as: :call
end
