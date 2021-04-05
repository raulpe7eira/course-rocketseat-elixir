defmodule Codex.Repos.Retrieve do
  def github_call(login) do
    github_client().user_repos(login)
  end

  defp github_client do
    :codex
    |> Application.fetch_env!(__MODULE__)
    |> Keyword.get(:github_adapter)
  end
end
