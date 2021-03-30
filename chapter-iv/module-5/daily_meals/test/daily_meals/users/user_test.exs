defmodule DailyMeals.Users.UserTest do
  use DailyMeals.DataCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.Users.User
  alias Ecto.Changeset

  @create_params build(:user_params)
  @update_params build(:user_params, nome: "Fulano", cpf: "47026165011", email: "fulano@mail.com")
  @invalid_params build(:user_params, nome: nil, cpf: nil, email: nil)

  describe "changeset/3" do
    test "when all params are valid, returns a valid changeset" do
      response = User.changeset(@create_params)

      assert %Changeset{
               changes: %{
                 nome: "Raul",
                 cpf: "20445478055",
                 email: "raul@mail.com"
               },
               errors: [],
               data: %DailyMeals.Users.User{},
               valid?: true
             } = response
    end

    test "when there are some error, returns an invalid changeset" do
      response = User.changeset(@invalid_params)

      expected_response = %{
        nome: ["can't be blank"],
        cpf: ["can't be blank"],
        email: ["can't be blank"]
      }

      assert expected_response == errors_on(response)
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      response =
        @create_params
        |> User.changeset()
        |> User.changeset(@update_params)

      assert %Changeset{
               changes: %{
                 nome: "Fulano",
                 cpf: "47026165011",
                 email: "fulano@mail.com"
               },
               errors: [],
               data: %DailyMeals.Users.User{},
               valid?: true
             } = response
    end
  end
end
