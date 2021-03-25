defmodule DailyMealsWeb.MealsControllerTest do
  use DailyMealsWeb.ConnCase, async: true

  import DailyMeals.Factory

  @create_params build(:meal_params)
  @update_params build(:meal_params, descricao: "Ovo", data: ~N[2021-03-24 17:00:00], calorias: 1)
  @invalid_params build(:meal_params, descricao: nil, data: nil, calorias: nil)

  @not_found_id "aa614eb5-c662-454d-8239-1de0aa55b684"
  @invalid_id "invalid-format"

  describe "create/2" do
    test "when all params are valid, creates the meal", %{conn: conn} do
      response =
        conn
        |> post(Routes.meals_path(conn, :create), @create_params)
        |> json_response(:created)

      assert %{
               "message" => "Meal created!",
               "detail" => %{
                 "meal" => %{
                   "id" => _id,
                   "descricao" => "Sopa",
                   "data" => "2021-03-24T18:00:00",
                   "calorias" => 20
                 }
               }
             } = response
    end

    test "when there are some error, returns an error", %{conn: conn} do
      response =
        conn
        |> post(Routes.meals_path(conn, :create), @invalid_params)
        |> json_response(:bad_request)

      expected_response = %{
        "message" => "Falha na requisição!",
        "detail" => %{
          "descricao" => ["can't be blank"],
          "data" => ["can't be blank"],
          "calorias" => ["can't be blank"]
        }
      }

      assert response == expected_response
    end
  end

  describe "show/2" do
    test "when all params are valid, show the meal", %{conn: conn} do
      meal = insert(:meal)

      response =
        conn
        |> get(Routes.meals_path(conn, :show, meal.id))
        |> json_response(:ok)

      expected_response = %{
        "message" => "Meal retrieved!",
        "detail" => %{
          "meal" => %{
            "id" => "27d34263-6b3f-4236-a2a1-3949c3804b93",
            "descricao" => "Sopa",
            "data" => "2021-03-24T18:00:00",
            "calorias" => 20
          }
        }
      }

      assert response == expected_response
    end

    test "when thre is no meal with given id, returns an error", %{conn: conn} do
      response =
        conn
        |> get(Routes.meals_path(conn, :show, @not_found_id))
        |> json_response(:bad_request)

      expected_response = %{"detail" => "Meal not found!", "message" => "Falha na requisição!"}

      assert response == expected_response
    end

    test "when an invalid format id is given, returns an error", %{conn: conn} do
      response =
        conn
        |> get(Routes.meals_path(conn, :show, @invalid_id))
        |> json_response(:bad_request)

      expected_response = %{"detail" => "Invalid id format!", "message" => "Falha na requisição!"}

      assert response == expected_response
    end
  end

  describe "update/2" do
    test "when all params are valid, update the meal", %{conn: conn} do
      meal = insert(:meal)

      response =
        conn
        |> put(Routes.meals_path(conn, :update, meal.id), @update_params)
        |> json_response(:ok)

      expected_response = %{
        "message" => "Meal updated!",
        "detail" => %{
          "meal" => %{
            "id" => "27d34263-6b3f-4236-a2a1-3949c3804b93",
            "descricao" => "Ovo",
            "data" => "2021-03-24T17:00:00",
            "calorias" => 1
          }
        }
      }

      assert response == expected_response
    end

    test "when thre is no meal with given id, returns an error", %{conn: conn} do
      insert(:meal)

      response =
        conn
        |> put(Routes.meals_path(conn, :update, @not_found_id), @update_params)
        |> json_response(:bad_request)

      expected_response = %{"detail" => "Meal not found!", "message" => "Falha na requisição!"}

      assert response == expected_response
    end

    test "when an invalid format id is given, returns an error", %{conn: conn} do
      insert(:meal)

      response =
        conn
        |> put(Routes.meals_path(conn, :update, @invalid_id), @update_params)
        |> json_response(:bad_request)

      expected_response = %{"detail" => "Invalid id format!", "message" => "Falha na requisição!"}

      assert response == expected_response
    end

    test "when there are some error, returns an error", %{conn: conn} do
      meal = insert(:meal)

      response =
        conn
        |> put(Routes.meals_path(conn, :update, meal.id), @invalid_params)
        |> json_response(:bad_request)

      expected_response = %{
        "message" => "Falha na requisição!",
        "detail" => %{
          "descricao" => ["can't be blank"],
          "data" => ["can't be blank"],
          "calorias" => ["can't be blank"]
        }
      }

      assert response == expected_response
    end
  end
end
