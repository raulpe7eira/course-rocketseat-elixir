defmodule DailyMeals.Meals.Create do
  alias DailyMeals.Meals.Meal
  alias DailyMeals.Repo
  alias DailyMeals.Users.Retrieve, as: RetrieveUser

  def call(params) do
    params
    |> get_user_id()
    |> RetrieveUser.call()
    |> do_insert(params)
    |> handle_insert()
  end

  defp get_user_id(params), do: Map.get(params, "user_id") || Map.get(params, :user_id)

  defp do_insert({:ok, user}, params) do
    params
    |> Meal.changeset(user)
    |> Repo.insert()
  end

  defp do_insert({:error, _reason} = error, _params), do: error

  defp handle_insert({:ok, %Meal{}} = success), do: success

  defp handle_insert({:error, _reason} = error), do: error
end
