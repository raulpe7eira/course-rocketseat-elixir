defmodule DailyMealsWeb.MealsViewTest do
  use DailyMealsWeb.ConnCase, async: true

  import DailyMeals.Factory
  import Phoenix.View

  alias DailyMealsWeb.MealsView

  test "renders create.json" do
    meal = build(:meal)

    response = render(MealsView, "create.json", meal: meal)

    expected_response = %{
      message: "Meal created!",
      detail: %{
        meal: %DailyMeals.Meals.Meal{
          id: "27d34263-6b3f-4236-a2a1-3949c3804b93",
          descricao: "Sopa",
          data: ~N[2021-03-24 18:00:00],
          calorias: 20,
          user_id: "d336107e-57bb-482e-9a30-944ef7ba2d53",
          user: %DailyMeals.Users.User{
            id: "d336107e-57bb-482e-9a30-944ef7ba2d53",
            nome: "Raul",
            cpf: "20445478055",
            email: "raul@mail.com"
          },
          inserted_at: nil,
          updated_at: nil
        }
      }
    }

    assert response == expected_response
  end

  test "renders retrieve.json" do
    meal = build(:meal)

    response = render(MealsView, "retrieve.json", meal: meal)

    expected_response = %{
      message: "Meal retrieved!",
      detail: %{
        meal: %DailyMeals.Meals.Meal{
          id: "27d34263-6b3f-4236-a2a1-3949c3804b93",
          descricao: "Sopa",
          data: ~N[2021-03-24 18:00:00],
          calorias: 20,
          user_id: "d336107e-57bb-482e-9a30-944ef7ba2d53",
          user: %DailyMeals.Users.User{
            id: "d336107e-57bb-482e-9a30-944ef7ba2d53",
            nome: "Raul",
            cpf: "20445478055",
            email: "raul@mail.com"
          },
          inserted_at: nil,
          updated_at: nil
        }
      }
    }

    assert response == expected_response
  end

  test "renders update.json" do
    meal = build(:meal)

    response = render(MealsView, "update.json", meal: meal)

    expected_response = %{
      message: "Meal updated!",
      detail: %{
        meal: %DailyMeals.Meals.Meal{
          id: "27d34263-6b3f-4236-a2a1-3949c3804b93",
          descricao: "Sopa",
          data: ~N[2021-03-24 18:00:00],
          calorias: 20,
          user_id: "d336107e-57bb-482e-9a30-944ef7ba2d53",
          user: %DailyMeals.Users.User{
            id: "d336107e-57bb-482e-9a30-944ef7ba2d53",
            nome: "Raul",
            cpf: "20445478055",
            email: "raul@mail.com"
          },
          inserted_at: nil,
          updated_at: nil
        }
      }
    }

    assert response == expected_response
  end
end
