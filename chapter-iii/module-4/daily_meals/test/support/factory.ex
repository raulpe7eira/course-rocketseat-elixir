defmodule DailyMeals.Factory do
  use ExMachina.Ecto, repo: DailyMeals.Repo

  def meal_params_factory do
    %{
      descricao: "Sopa",
      data: "2021-03-24T18:00:00Z",
      calorias: 20
    }
  end
end
