defmodule CodexWeb.UsersControllerTest do
  use CodexWeb.ConnCase, async: true

  import Codex.Factory

  @create_params build(:user_params)
  @invalid_params build(:user_params, password: nil)

  @login_params build(:login_params)
  @wrong_id build(:login_params, id: "aa614eb5-c662-454d-8239-1de0aa55b684")
  @wrong_password build(:login_params, password: "654321")

  @no_params %{}

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      response =
        conn
        |> post(Routes.users_path(conn, :create), @create_params)
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "detail" => %{"user" => %{"id" => _id}}
             } = response
    end

    test "when there are some error, returns an error", %{conn: conn} do
      response =
        conn
        |> post(Routes.users_path(conn, :create), @invalid_params)
        |> json_response(:unprocessable_entity)

      expected_response = %{
        "message" => "Falha na requisição!",
        "detail" => %{"password" => ["can't be blank"]}
      }

      assert response == expected_response
    end
  end

  describe "login/2" do
    test "when all params are valid, logins the user", %{conn: conn} do
      insert(:user)

      response =
        conn
        |> post(Routes.users_path(conn, :login), @login_params)
        |> json_response(:ok)

      assert %{"token" => _token} = response
    end

    test "when an wrong id given, returns an error", %{conn: conn} do
      response =
        conn
        |> post(Routes.users_path(conn, :login), @wrong_id)
        |> json_response(:not_found)

      expected_response = %{
        "message" => "Falha na requisição!",
        "detail" => "User not found!"
      }

      assert response == expected_response
    end

    test "when an wrong password is given, returns an error", %{conn: conn} do
      insert(:user)

      response =
        conn
        |> post(Routes.users_path(conn, :login), @wrong_password)
        |> json_response(:unauthorized)

      expected_response = %{
        "message" => "Falha na requisição!",
        "detail" => "Please verify your credentials!"
      }

      assert response == expected_response
    end

    test "when no params are given, returns an error", %{conn: conn} do
      response =
        conn
        |> post(Routes.users_path(conn, :login), @no_params)
        |> json_response(:bad_request)

      expected_response = %{
        "message" => "Falha na requisição!",
        "detail" => "Invalid or missing params!"
      }

      assert response == expected_response
    end
  end
end
