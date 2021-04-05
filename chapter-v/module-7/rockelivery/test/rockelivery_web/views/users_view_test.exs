defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)
    token = "valid-token"

    response = render(UsersView, "create.json", token: token, user: user)

    assert %{
             message: "User created!",
             token: "valid-token",
             user: %Rockelivery.User{
               age: 22,
               address: "Rua X, 123",
               cep: "12345678",
               cpf: "47971092032",
               email: "raul@mail.com",
               password: "123456",
               password_hash: nil,
               name: "Raul Pereira",
               id: "27d34263-6b3f-4236-a2a1-3949c3804b93",
               inserted_at: nil,
               updated_at: nil
             }
           } == response
  end
end
