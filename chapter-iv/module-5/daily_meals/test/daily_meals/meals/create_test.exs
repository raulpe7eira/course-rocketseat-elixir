defmodule DailyMeals.Meals.CreateTest do
  use DailyMeals.DataCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.Meals.{Create, Meal}

  @create_params build(:meal_params)
  @invalid_params build(:meal_params, descricao: nil, data: nil, calorias: nil)

  describe "call/1" do
    test "when all params are valid, returns the meal" do
      insert(:user)

      response = Create.call(@create_params)

      assert {:ok,
              %Meal{
                id: _id,
                descricao: "Sopa",
                data: ~N[2021-03-24 18:00:00],
                calorias: 20
              }} = response
    end

    test "when there is user not found, returns an error" do
      response = Create.call(@create_params)

      expected_response = {:error, "User not found!"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      insert(:user)

      response = Create.call(@invalid_params)

      expected_response = %{
        descricao: ["can't be blank"],
        data: ["can't be blank"],
        calorias: ["can't be blank"]
      }

      assert {:error, changeset} = response
      assert expected_response == errors_on(changeset)
    end
  end
end
