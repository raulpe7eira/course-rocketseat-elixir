defmodule DailyMealsWeb.MealsController do
  use DailyMealsWeb, :controller

  alias DailyMeals.Meals.Meal
  alias DailyMealsWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- DailyMeals.create_meal(params) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Meal{} = meal} <- DailyMeals.retrieve_meal_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("retrieve.json", meal: meal)
    end
  end
end
