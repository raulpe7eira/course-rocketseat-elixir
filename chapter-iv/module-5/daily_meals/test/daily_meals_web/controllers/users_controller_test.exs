defmodule DailyMealsWeb.UsersControllerTest do
  use DailyMealsWeb.ConnCase, async: true

  import DailyMeals.Factory

  @create_params build(:user_params)
  @invalid_params build(:user_params, nome: nil, cpf: nil, email: nil)

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      response =
        conn
        |> post(Routes.users_path(conn, :create), @create_params)
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "detail" => %{
                 "user" => %{
                   "id" => _id,
                   "nome" => "Raul",
                   "cpf" => "20445478055",
                   "email" => "raul@mail.com"
                 }
               }
             } = response
    end

    test "when there are some error, returns an error", %{conn: conn} do
      response =
        conn
        |> post(Routes.users_path(conn, :create), @invalid_params)
        |> json_response(:bad_request)

      expected_response = %{
        "message" => "Falha na requisição!",
        "detail" => %{
          "nome" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"]
        }
      }

      assert response == expected_response
    end
  end
end
