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

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{}} <- DailyMeals.delete_user(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- DailyMeals.retrieve_user(id) do
      conn
      |> put_status(:ok)
      |> render("retrieve.json", user: user)
    end
  end

  def update(conn, %{"id" => id} = params) do
    with {:ok, %User{} = user} <- DailyMeals.update_user(id, params) do
      conn
      |> put_status(:ok)
      |> render("update.json", user: user)
    end
  end
end
