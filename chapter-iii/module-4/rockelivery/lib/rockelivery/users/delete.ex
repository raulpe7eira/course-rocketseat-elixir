defmodule Rockelivery.Users.Delete do
  alias Ecto.UUID
  alias Rockelivery.{Repo, User}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, %{status: :bad_request, result: "Invalid id format!"}}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case Repo.get(User, uuid) do
      nil -> {:error, %{status: :not_found, result: "User not found!"}}
      user -> Repo.delete(user)
    end
  end
end
