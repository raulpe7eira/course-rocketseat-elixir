defmodule DailyMeals.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :nome, :string, null: false
      add :cpf, :string, null: false
      add :email, :string, null: false

      timestamps()
    end

    create unique_index(:users, [:cpf])
    create unique_index(:users, [:email])
  end
end
