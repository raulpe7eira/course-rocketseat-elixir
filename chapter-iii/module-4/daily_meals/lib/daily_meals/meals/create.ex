defmodule DailyMeals.Meals.Create do
  alias DailyMeals.Meals.Meal
  alias DailyMeals.Repo

  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Meal{}} = success), do: success

  defp handle_insert({:error, _reason} = error), do: error
end
