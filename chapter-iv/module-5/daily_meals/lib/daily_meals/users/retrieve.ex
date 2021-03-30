defmodule DailyMeals.Users.Retrieve do
  alias DailyMeals.Repo
  alias DailyMeals.Users.User

  def call(id) do
    case Repo.get(User, id) |> Repo.preload(:meals) do
      nil -> {:error, "User not found!"}
      user -> {:ok, user}
    end
  end
end
