defmodule DailyMeals.Users.Create do
  alias DailyMeals.Repo
  alias DailyMeals.Users.User

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{}} = success), do: success

  defp handle_insert({:error, _reason} = error), do: error
end
