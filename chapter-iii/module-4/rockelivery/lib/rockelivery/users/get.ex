defmodule Rockelivery.Users.Get do
  alias Ecto.UUID
  alias Rockelivery.{Repo, User}

  def by_id(id) do
    case UUID.cast(id) do
      :error -> {:error, %{status: :bad_request, result: "Invalid id format!"}}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(User, uuid) do
      nil -> {:error, %{status: :not_found, result: "User not found!"}}
      user -> {:ok, user}
    end
  end
end
