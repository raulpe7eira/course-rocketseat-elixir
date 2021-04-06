defmodule Codex.Users.Retrieve do
  alias Codex.Error
  alias Codex.Repo
  alias Codex.Users.User

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build(:not_found, "User not found!")}
      user -> {:ok, user}
    end
  end
end
