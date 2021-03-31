defmodule Codex.Github.Behaviour do
  alias Codex.Error

  @callback user_repos(String.t()) :: {:ok, map()} | {:error, Error.t()}
end
