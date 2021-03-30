defmodule DailyMeals.Users.Update do
  alias DailyMeals.Users.User
  alias DailyMeals.Repo

  def call(id, params) do
    case Repo.get(User, id) do
      nil -> {:error, "User not found!"}
      user -> do_update(user, params)
    end
  end

  defp do_update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
    |> handle_update()
  end

  defp handle_update({:ok, %User{}} = success), do: success

  defp handle_update({:error, _reason} = error), do: error
end
