defmodule DailyMeals.Repo.Migrations.CreateMealsTable do
  use Ecto.Migration

  def change do
    create table :meals do
      add :descricao, :string
      add :data, :naive_datetime
      add :calorias, :integer

      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end

    create unique_index(:meals, [:descricao])
  end
end
