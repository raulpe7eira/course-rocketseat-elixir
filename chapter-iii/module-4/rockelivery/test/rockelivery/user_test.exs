defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  alias Ecto.Changeset
  alias Rockelivery.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        age: 22,
        address: "Rua X, 123",
        cep: "12345678",
        cpf: "47971092032",
        email: "raul@mail.com",
        password: "123456",
        name: "Raul Pereira"
      }

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "Raul Pereira"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = %{
        age: 22,
        address: "Rua X, 123",
        cep: "12345678",
        cpf: "47971092032",
        email: "raul@mail.com",
        password: "123456",
        name: "Raul Pereira"
      }

      update_params = %{
        name: "Raul Silva"
      }

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "Raul Silva"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = %{
        age: 10,
        address: "Rua X, 123",
        cep: "12345678",
        cpf: "47971092032",
        email: "raul@mail.com",
        password: "123",
        name: "Raul Pereira"
      }

      response = User.changeset(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
