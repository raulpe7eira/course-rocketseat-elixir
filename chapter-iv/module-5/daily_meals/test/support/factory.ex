defmodule DailyMeals.Factory do
  use ExMachina.Ecto, repo: DailyMeals.Repo

  alias DailyMeals.Meals.Meal

  def user_params_factory do
    %{
      nome: "Raul",
      cpf: "20445478055",
      email: "raul@mail.com"
    }
  end

  def meal_params_factory do
    %{
      descricao: "Sopa",
      data: "2021-03-24T18:00:00Z",
      calorias: 20,
      user_id: "d336107e-57bb-482e-9a30-944ef7ba2d53"
    }
  end

  def meal_factory do
    %Meal{
      id: "27d34263-6b3f-4236-a2a1-3949c3804b93",
      descricao: "Sopa",
      data: ~N[2021-03-24 18:00:00],
      calorias: 20,
      user_id: "d336107e-57bb-482e-9a30-944ef7ba2d53"
    }
  end
end
