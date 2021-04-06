defmodule Codex.Users.Create do
  alias Codex.{Error, Repo}
  alias Codex.Users.User

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{}} = success), do: success

  defp handle_insert({:error, reason}), do: {:error, Error.build(:unprocessable_entity, reason)}
end
