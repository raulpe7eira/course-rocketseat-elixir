defmodule DailyMeals.Meals.Update do
  alias DailyMeals.Meals.Meal
  alias DailyMeals.Repo

  def call(id, params) do
    case Repo.get(Meal, id) do
      nil -> {:error, "Meal not found!"}
      meal -> do_update(meal, params)
    end
  end

  defp do_update(meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
    |> handle_update()
  end

  defp handle_update({:ok, %Meal{}} = success), do: success

  defp handle_update({:error, _reason} = error), do: error
end
