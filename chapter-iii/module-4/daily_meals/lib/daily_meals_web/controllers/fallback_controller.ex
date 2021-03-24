defmodule DailyMealsWeb.FallbackController do
  use DailyMealsWeb, :controller

  alias DailyMealsWeb.ErrorView

  def call(conn, {:error, detail}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ErrorView)
    |> render("error.json", detail: detail)
  end
end
