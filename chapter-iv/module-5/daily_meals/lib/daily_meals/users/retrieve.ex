defmodule DailyMeals.Users.Retrieve do
  alias DailyMeals.Users.User
  alias DailyMeals.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, "User not found!"}
      user -> {:ok, user}
    end
  end
end
