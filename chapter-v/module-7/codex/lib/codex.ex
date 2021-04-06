defmodule Codex do
  alias Codex.Repos.Retrieve, as: RetrieveRepos

  alias Codex.Users.Create, as: CreateUser

  defdelegate retrieve_github_user_repos(login), to: RetrieveRepos, as: :github_call

  defdelegate create_user(params), to: CreateUser, as: :call
end
