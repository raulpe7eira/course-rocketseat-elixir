defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{
        "age" => 22,
        "address" => "Rua X, 123",
        "cep" => "12345678",
        "cpf" => "47971092032",
        "email" => "raul@mail.com",
        "password" => "123456",
        "name" => "Raul Pereira"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "user" => %{
                 "address" => "Rua X, 123",
                 "age" => 22,
                 "cep" => "12345678",
                 "cpf" => "47971092032",
                 "email" => "raul@mail.com",
                 "id" => _id,
                 "name" => "Raul Pereira"
               }
             } = response
    end

    test "when there are some error, returns the error", %{conn: conn} do
      params = %{
        "password" => "123456",
        "name" => "Raul Pereira"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      assert %{
               "message" => %{
                 "address" => ["can't be blank"],
                 "age" => ["can't be blank"],
                 "cep" => ["can't be blank"],
                 "cpf" => ["can't be blank"],
                 "email" => ["can't be blank"]
               }
             } = response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "27d34263-6b3f-4236-a2a1-3949c3804b93"
      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
