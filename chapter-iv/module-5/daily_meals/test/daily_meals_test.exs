defmodule DailyMealsTest do
  use DailyMeals.DataCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.Meals.Meal
  alias DailyMeals.Users.User

  describe "meal" do
    test "creates" do
      insert(:user)

      params = build(:meal_params)

      response = DailyMeals.create_meal(params)

      assert {:ok,
              %Meal{
                id: _id,
                descricao: "Sopa",
                data: ~N[2021-03-24 18:00:00],
                calorias: 20,
                inserted_at: _inserted_at,
                updated_at: _updated_at
              }} = response
    end

    test "deletes" do
      meal = insert(:meal)

      response = DailyMeals.delete_meal(meal.id)

      assert {:ok,
              %Meal{
                id: "27d34263-6b3f-4236-a2a1-3949c3804b93",
                descricao: "Sopa",
                data: ~N[2021-03-24 18:00:00],
                calorias: 20,
                inserted_at: _inserted_at,
                updated_at: _updated_at
              }} = response
    end

    test "retrieves" do
      meal = insert(:meal)

      response = DailyMeals.retrieve_meal(meal.id)

      assert {:ok,
              %Meal{
                id: "27d34263-6b3f-4236-a2a1-3949c3804b93",
                descricao: "Sopa",
                data: ~N[2021-03-24 18:00:00],
                calorias: 20,
                inserted_at: _inserted_at,
                updated_at: _updated_at
              }} = response
    end

    test "updates" do
      meal = insert(:meal)
      params = build(:meal_params, descricao: "Ovo", data: ~N[2021-03-24 17:00:00], calorias: 1)

      response = DailyMeals.update_meal(meal.id, params)

      assert {:ok,
              %Meal{
                id: "27d34263-6b3f-4236-a2a1-3949c3804b93",
                descricao: "Ovo",
                data: ~N[2021-03-24 17:00:00],
                calorias: 1,
                inserted_at: _inserted_at,
                updated_at: _updated_at
              }} = response
    end
  end

  describe "user" do
    test "creates" do
      params = build(:user_params)

      response = DailyMeals.create_user(params)

      assert {:ok,
              %User{
                id: _id,
                nome: "Raul",
                cpf: "20445478055",
                email: "raul@mail.com",
                inserted_at: _inserted_at,
                updated_at: _updated_at
              }} = response
    end

    test "deletes" do
      user = insert(:user)

      response = DailyMeals.delete_user(user.id)

      assert {:ok,
              %User{
                id: "d336107e-57bb-482e-9a30-944ef7ba2d53",
                nome: "Raul",
                cpf: "20445478055",
                email: "raul@mail.com",
                inserted_at: _inserted_at,
                updated_at: _updated_at
              }} = response
    end

    test "retrieves" do
      user = insert(:user)

      response = DailyMeals.retrieve_user(user.id)

      assert {:ok,
              %User{
                id: "d336107e-57bb-482e-9a30-944ef7ba2d53",
                nome: "Raul",
                cpf: "20445478055",
                email: "raul@mail.com",
                inserted_at: _inserted_at,
                updated_at: _updated_at
              }} = response
    end

    test "updates" do
      user = insert(:user)
      params = build(:user_params, nome: "Fulano", cpf: "47026165011", email: "fulano@mail.com")

      response = DailyMeals.update_user(user.id, params)

      assert {:ok,
              %User{
                id: "d336107e-57bb-482e-9a30-944ef7ba2d53",
                nome: "Fulano",
                cpf: "47026165011",
                email: "fulano@mail.com",
                inserted_at: _inserted_at,
                updated_at: _updated_at
              }} = response
    end
  end
end
