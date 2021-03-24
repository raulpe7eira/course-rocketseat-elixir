defmodule DailyMealsWeb.MealsControllerTest do
  use DailyMealsWeb.ConnCase, async: true

  describe "create/2" do
    test "when all params are valid, creates the meal", %{conn: conn} do
      params = %{
        "descricao" => "Sopa",
        "data" => "2021-03-24T18:00:00Z",
        "calorias" => 20
      }

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:created)

      assert %{
              "detail" => %{
                "meal" => %{
                  "id" => _id,
                  "descricao" => "Sopa",
                  "data" => "2021-03-24T18:00:00Z",
                  "calorias" => 20
                }
              },
              "message" => "Meal created!"
            } = response
    end

    test "when there are some error, returns the error", %{conn: conn} do
      params = %{"descricao" => "Sopa"}

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:bad_request)

      assert %{
              "detail" => %{
                "calorias" => ["can't be blank"],
                "data" => ["can't be blank"]
              },
              "message" => "Falha na requisição!"
            } = response
    end
  end
end
