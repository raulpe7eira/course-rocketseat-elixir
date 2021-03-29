defmodule DailyMeals do
  alias DailyMeals.Meals.Create, as: CreateMeal
  alias DailyMeals.Meals.Delete, as: DeleteMeal
  alias DailyMeals.Meals.Retrieve, as: RetrieveMeal
  alias DailyMeals.Meals.Update, as: UpdateMeal

  defdelegate create_meal(params), to: CreateMeal, as: :call
  defdelegate delete_meal(id), to: DeleteMeal, as: :call
  defdelegate retrieve_meal(id), to: RetrieveMeal, as: :call
  defdelegate update_meal(id, params), to: UpdateMeal, as: :call
end
