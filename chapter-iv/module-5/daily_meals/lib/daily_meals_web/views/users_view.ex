defmodule DailyMealsWeb.UsersView do
  use DailyMealsWeb, :view

  alias DailyMeals.Users.User

  def render("create.json", %{user: %User{} = user}) do
    %{message: "User created!", detail: %{user: user}}
  end

  def render("retrieve.json", %{user: %User{} = user}) do
    %{message: "User retrieved!", detail: %{user: user}}
  end

  def render("update.json", %{user: %User{} = user}) do
    %{message: "User updated!", detail: %{user: user}}
  end
end
