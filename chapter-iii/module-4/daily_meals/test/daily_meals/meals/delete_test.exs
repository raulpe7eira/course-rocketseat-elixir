defmodule DailyMeals.Meals.DeleteTest do
  use DailyMeals.DataCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.Meals.{Delete, Meal}

  @not_found_id "aa614eb5-c662-454d-8239-1de0aa55b684"

  describe "call/1" do
    test "when all params are valid, deletes the meal" do
      meal = insert(:meal)

      response = Delete.call(meal.id)

      assert {:ok,
              %Meal{
                id: _id,
                descricao: "Sopa",
                data: ~N[2021-03-24 18:00:00],
                calorias: 20
              }} = response
    end

    test "when there are invalid params, returns an error" do
      insert(:meal)

      response = Delete.call(@not_found_id)

      expected_response = {:error, "Meal not found!"}

      assert expected_response == response
    end
  end
end
