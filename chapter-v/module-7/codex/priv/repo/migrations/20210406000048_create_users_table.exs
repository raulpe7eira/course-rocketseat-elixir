defmodule Codex.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:password_hash, :string, null: false)

      timestamps()
    end
  end
end
