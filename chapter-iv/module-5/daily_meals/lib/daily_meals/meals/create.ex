defmodule DailyMeals.Meals.Create do
  alias DailyMeals.Meals.Meal
  alias DailyMeals.Repo
  alias DailyMeals.Users.Retrieve, as: RetrieveUser

  def call(user_id, params) do
    user_id
    |> RetrieveUser.call()
    |> do_insert(params)
    |> handle_insert()
  end

  defp do_insert({:ok, user}, params) do
    params
    |> Meal.changeset(user)
    |> Repo.insert()
  end

  defp do_insert({:error, _reason} = error, _params), do: error

  defp handle_insert({:ok, %Meal{}} = success), do: success

  defp handle_insert({:error, _reason} = error), do: error
end
