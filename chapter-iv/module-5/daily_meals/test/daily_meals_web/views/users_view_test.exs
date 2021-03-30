defmodule DailyMealsWeb.UsersViewTest do
  use DailyMealsWeb.ConnCase, async: true

  import DailyMeals.Factory
  import Phoenix.View

  alias DailyMealsWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created!",
      detail: %{
        user: %DailyMeals.Users.User{
          id: "d336107e-57bb-482e-9a30-944ef7ba2d53",
          nome: "Raul",
          cpf: "20445478055",
          email: "raul@mail.com",
          inserted_at: nil,
          updated_at: nil
        }
      }
    }

    assert response == expected_response
  end

  test "renders retrieve.json" do
    user = build(:user)

    response = render(UsersView, "retrieve.json", user: user)

    expected_response = %{
      message: "User retrieved!",
      detail: %{
        user: %DailyMeals.Users.User{
          id: "d336107e-57bb-482e-9a30-944ef7ba2d53",
          nome: "Raul",
          cpf: "20445478055",
          email: "raul@mail.com",
          inserted_at: nil,
          updated_at: nil
        }
      }
    }

    assert response == expected_response
  end

  test "renders update.json" do
    user = build(:user)

    response = render(UsersView, "update.json", user: user)

    expected_response = %{
      message: "User updated!",
      detail: %{
        user: %DailyMeals.Users.User{
          id: "d336107e-57bb-482e-9a30-944ef7ba2d53",
          nome: "Raul",
          cpf: "20445478055",
          email: "raul@mail.com",
          inserted_at: nil,
          updated_at: nil
        }
      }
    }

    assert response == expected_response
  end
end
