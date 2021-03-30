defmodule DailyMealsWeb.UsersControllerTest do
  use DailyMealsWeb.ConnCase, async: true

  import DailyMeals.Factory

  @create_params build(:user_params)
  @update_params build(:user_params, nome: "Fulano", cpf: "47026165011", email: "fulano@mail.com")
  @invalid_params build(:user_params, nome: nil, cpf: nil, email: nil)

  @not_found_id "aa614eb5-c662-454d-8239-1de0aa55b684"
  @invalid_id "invalid-format"

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

  describe "delete/2" do
    test "when all params are valid, deletes the user", %{conn: conn} do
      user = insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, user.id))
        |> response(:no_content)

      expected_response = ""

      assert response == expected_response
    end

    test "when thre is no user with given id, returns an error", %{conn: conn} do
      response =
        conn
        |> delete(Routes.users_path(conn, :delete, @not_found_id))
        |> json_response(:bad_request)

      expected_response = %{"detail" => "User not found!", "message" => "Falha na requisição!"}

      assert response == expected_response
    end

    test "when an invalid format id is given, returns an error", %{conn: conn} do
      response =
        conn
        |> delete(Routes.users_path(conn, :delete, @invalid_id))
        |> json_response(:bad_request)

      expected_response = %{"detail" => "Invalid id format!", "message" => "Falha na requisição!"}

      assert response == expected_response
    end
  end

  describe "show/2" do
    test "when all params are valid, show the user", %{conn: conn} do
      user = insert(:user)

      response =
        conn
        |> get(Routes.users_path(conn, :show, user.id))
        |> json_response(:ok)

      expected_response = %{
        "message" => "User retrieved!",
        "detail" => %{
          "user" => %{
            "id" => "d336107e-57bb-482e-9a30-944ef7ba2d53",
            "nome" => "Raul",
            "cpf" => "20445478055",
            "email" => "raul@mail.com",
            "meals" => []
          }
        }
      }

      assert response == expected_response
    end

    test "when thre is no user with given id, returns an error", %{conn: conn} do
      response =
        conn
        |> get(Routes.users_path(conn, :show, @not_found_id))
        |> json_response(:bad_request)

      expected_response = %{"detail" => "User not found!", "message" => "Falha na requisição!"}

      assert response == expected_response
    end

    test "when an invalid format id is given, returns an error", %{conn: conn} do
      response =
        conn
        |> get(Routes.users_path(conn, :show, @invalid_id))
        |> json_response(:bad_request)

      expected_response = %{"detail" => "Invalid id format!", "message" => "Falha na requisição!"}

      assert response == expected_response
    end
  end

  describe "update/2" do
    test "when all params are valid, updates the user", %{conn: conn} do
      user = insert(:user)

      response =
        conn
        |> put(Routes.users_path(conn, :update, user.id), @update_params)
        |> json_response(:ok)

      expected_response = %{
        "message" => "User updated!",
        "detail" => %{
          "user" => %{
            "id" => "d336107e-57bb-482e-9a30-944ef7ba2d53",
            "nome" => "Fulano",
            "cpf" => "47026165011",
            "email" => "fulano@mail.com",
            "meals" => []
          }
        }
      }

      assert response == expected_response
    end

    test "when thre is no user with given id, returns an error", %{conn: conn} do
      insert(:user)

      response =
        conn
        |> put(Routes.users_path(conn, :update, @not_found_id), @update_params)
        |> json_response(:bad_request)

      expected_response = %{"detail" => "User not found!", "message" => "Falha na requisição!"}

      assert response == expected_response
    end

    test "when an invalid format id is given, returns an error", %{conn: conn} do
      insert(:user)

      response =
        conn
        |> put(Routes.users_path(conn, :update, @invalid_id), @update_params)
        |> json_response(:bad_request)

      expected_response = %{"detail" => "Invalid id format!", "message" => "Falha na requisição!"}

      assert response == expected_response
    end

    test "when there are some error, returns an error", %{conn: conn} do
      user = insert(:user)

      response =
        conn
        |> put(Routes.users_path(conn, :update, user.id), @invalid_params)
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
