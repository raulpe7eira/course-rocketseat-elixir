defmodule DailyMeals.Repo.Migrations.CreateMealsTable do
  use Ecto.Migration

  def change do
    create table(:meals) do
      add :descricao, :string, null: false
      add :data, :naive_datetime, null: false
      add :calorias, :integer, null: false

      timestamps()
    end

    create unique_index(:meals, [:descricao])
  end
end
