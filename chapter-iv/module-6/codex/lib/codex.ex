defmodule Codex do
  alias Codex.Github.Client, as: ClientGitHub

  defdelegate retrieve_github_user_repos(login), to: ClientGitHub, as: :user_repos
end
