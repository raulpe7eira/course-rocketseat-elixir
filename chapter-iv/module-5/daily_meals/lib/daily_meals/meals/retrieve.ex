defmodule DailyMeals.Meals.Retrieve do
  alias DailyMeals.Meals.Meal
  alias DailyMeals.Repo

  def call(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, "Meal not found!"}
      meal -> {:ok, meal}
    end
  end
end
