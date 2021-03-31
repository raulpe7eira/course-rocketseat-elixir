defmodule DailyMeals do
  alias DailyMeals.Meals.Create, as: CreateMeal
  alias DailyMeals.Meals.Delete, as: DeleteMeal
  alias DailyMeals.Meals.Retrieve, as: RetrieveMeal
  alias DailyMeals.Meals.Update, as: UpdateMeal

  alias DailyMeals.Users.Create, as: CreateUser
  alias DailyMeals.Users.Delete, as: DeleteUser
  alias DailyMeals.Users.Retrieve, as: RetrieveUser
  alias DailyMeals.Users.Update, as: UpdateUser

  defdelegate create_meal(params), to: CreateMeal, as: :call
  defdelegate delete_meal(id), to: DeleteMeal, as: :call
  defdelegate retrieve_meal(id), to: RetrieveMeal, as: :call
  defdelegate update_meal(id, params), to: UpdateMeal, as: :call

  defdelegate create_user(params), to: CreateUser, as: :call
  defdelegate delete_user(id), to: DeleteUser, as: :call
  defdelegate retrieve_user(id), to: RetrieveUser, as: :call
  defdelegate update_user(id, params), to: UpdateUser, as: :call
end
