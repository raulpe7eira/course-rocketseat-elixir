defmodule Codex.Users.UserTest do
  use Codex.DataCase, async: true

  import Codex.Factory

  alias Codex.Users.User
  alias Ecto.Changeset

  @create_params build(:user_params)
  @invalid_params build(:user_params, password: nil)

  describe "changeset/3" do
    test "when all params are valid, returns a valid changeset" do
      response = User.changeset(@create_params)

      assert %Changeset{
               changes: %{
                 password: _password,
                 password_hash: _password_hash
               },
               errors: [],
               data: %User{},
               valid?: true
             } = response
    end

    test "when there are some error, returns an invalid changeset" do
      response = User.changeset(@invalid_params)

      expected_response = %{password: ["can't be blank"]}

      assert expected_response == errors_on(response)
    end
  end
end
