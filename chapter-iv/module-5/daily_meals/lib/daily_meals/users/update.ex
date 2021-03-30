defmodule DailyMeals.Users.Update do
  alias DailyMeals.Repo
  alias DailyMeals.Users.User

  def call(id, params) do
    case Repo.get(User, id) |> Repo.preload(:meals) do
      nil -> {:error, "User not found!"}
      user -> do_update(user, params)
    end
  end

  defp do_update(user, params) do
    user
    |> User.changeset(params, user.meals)
    |> Repo.update()
    |> handle_update()
  end

  defp handle_update({:ok, %User{}} = success), do: success

  defp handle_update({:error, _reason} = error), do: error
end
