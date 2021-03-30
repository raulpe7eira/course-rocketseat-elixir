defmodule DailyMeals do
  alias DailyMeals.Meals.Create, as: CreateMeal
  alias DailyMeals.Meals.Delete, as: DeleteMeal
  alias DailyMeals.Meals.Retrieve, as: RetrieveMeal
  alias DailyMeals.Meals.Update, as: UpdateMeal

  alias DailyMeals.Users.Create, as: CreateUser

  defdelegate create_meal(params), to: CreateMeal, as: :call
  defdelegate delete_meal(id), to: DeleteMeal, as: :call
  defdelegate retrieve_meal(id), to: RetrieveMeal, as: :call
  defdelegate update_meal(id, params), to: UpdateMeal, as: :call

  defdelegate create_user(params), to: CreateUser, as: :call
end
