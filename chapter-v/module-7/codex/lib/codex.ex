defmodule Codex do
  alias Codex.Repos.Retrieve, as: RetrieveRepos

  defdelegate retrieve_github_user_repos(login), to: RetrieveRepos, as: :github_call
end
