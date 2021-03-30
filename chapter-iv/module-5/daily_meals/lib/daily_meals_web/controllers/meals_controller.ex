defmodule DailyMealsWeb.MealsController do
  use DailyMealsWeb, :controller

  alias DailyMeals.Meals.Meal
  alias DailyMealsWeb.FallbackController

  action_fallback FallbackController

  def create(conn, %{"user_id" => user_id} = params) do
    with {:ok, %Meal{} = meal} <- DailyMeals.create_meal(user_id, params) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Meal{}} <- DailyMeals.delete_meal(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Meal{} = meal} <- DailyMeals.retrieve_meal(id) do
      conn
      |> put_status(:ok)
      |> render("retrieve.json", meal: meal)
    end
  end

  def update(conn, %{"id" => id} = params) do
    with {:ok, %Meal{} = meal} <- DailyMeals.update_meal(id, params) do
      conn
      |> put_status(:ok)
      |> render("update.json", meal: meal)
    end
  end
end
