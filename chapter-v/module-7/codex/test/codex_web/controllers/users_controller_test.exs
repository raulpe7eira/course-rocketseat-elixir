defmodule CodexWeb.UsersControllerTest do
  use CodexWeb.ConnCase, async: true

  import Codex.Factory

  @create_params build(:user_params)
  @invalid_params build(:user_params, password: nil)

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
end
