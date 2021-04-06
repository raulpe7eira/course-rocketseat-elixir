defmodule Codex.Users.RetrieveTest do
  use Codex.DataCase, async: true

  import Codex.Factory

  alias Codex.Error
  alias Codex.Users.{Retrieve, User}

  @not_found_id "aa614eb5-c662-454d-8239-1de0aa55b684"

  describe "call/1" do
    test "when all params are valid, returns the user" do
      user = insert(:user)

      response = Retrieve.call(user.id)

      assert {:ok, %User{id: _id}} = response
    end

    test "when there are invalid params, returns an error" do
      insert(:user)

      response = Retrieve.call(@not_found_id)

      expected_response = {:error, %Error{status: :not_found, result: "User not found!"}}

      assert expected_response == response
    end
  end
end
