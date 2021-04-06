defmodule Codex.Users.CreateTest do
  use Codex.DataCase, async: true

  import Codex.Factory

  alias Codex.Error
  alias Codex.Users.{Create, User}

  @create_params build(:user_params)
  @invalid_params build(:user_params, password: nil)

  describe "call/1" do
    test "when all params are valid, returns the user" do
      response = Create.call(@create_params)

      assert {:ok, %User{id: _id}} = response
    end

    test "when there are invalid params, returns an error" do
      response = Create.call(@invalid_params)

      expected_response = %{password: ["can't be blank"]}

      assert {:error, %Error{status: :unprocessable_entity, result: changeset}} = response
      assert expected_response == errors_on(changeset)
    end
  end
end
