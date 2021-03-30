defmodule DailyMeals.Users.DeleteTest do
  use DailyMeals.DataCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.Users.{Delete, User}

  @not_found_id "aa614eb5-c662-454d-8239-1de0aa55b684"

  describe "call/1" do
    test "when all params are valid, deletes the user" do
      user = insert(:user)

      response = Delete.call(user.id)

      assert {:ok,
              %User{
                id: _id,
                nome: "Raul",
                cpf: "20445478055",
                email: "raul@mail.com"
              }} = response
    end

    test "when there are invalid params, returns an error" do
      insert(:user)

      response = Delete.call(@not_found_id)

      expected_response = {:error, "User not found!"}

      assert expected_response == response
    end
  end
end
