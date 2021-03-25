defmodule DailyMealsWeb.MealsControllerTest do
  use DailyMealsWeb.ConnCase, async: true

  import DailyMeals.Factory

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

  describe "show/2" do
    test "when all params are valid, show the meal", %{conn: conn} do
      id = "27d34263-6b3f-4236-a2a1-3949c3804b93"
      insert(:meal)

      response =
        conn
        |> get(Routes.meals_path(conn, :show, id))
        |> json_response(:ok)

      expected_response = %{
        "message" => "Meal retrieved!",
        "detail" => %{
          "meal" => %{
            "id" => "27d34263-6b3f-4236-a2a1-3949c3804b93",
            "descricao" => "Sopa",
            "data" => "2021-03-24T18:00:00Z",
            "calorias" => 20
          }
        }
      }

      assert response == expected_response
    end

    test "when the id is not found, returns the error", %{conn: conn} do
      id = "aa614eb5-c662-454d-8239-1de0aa55b684"

      response =
        conn
        |> get(Routes.meals_path(conn, :show, id))
        |> json_response(:bad_request)

      expected_response = %{"detail" => "Meal not found!", "message" => "Falha na requisição!"}

      assert response == expected_response
    end

    test "when the id is in an invalid format, returns the error", %{conn: conn} do
      id = "invalid-format"

      response =
        conn
        |> get(Routes.meals_path(conn, :show, id))
        |> json_response(:bad_request)

      expected_response = %{"detail" => "Invalid id format!", "message" => "Falha na requisição!"}

      assert response == expected_response
    end
  end
end
