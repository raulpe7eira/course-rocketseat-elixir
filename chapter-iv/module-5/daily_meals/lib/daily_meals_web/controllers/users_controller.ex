defmodule DailyMealsWeb.UsersController do
  use DailyMealsWeb, :controller

  alias DailyMeals.Users.User
  alias DailyMealsWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- DailyMeals.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
