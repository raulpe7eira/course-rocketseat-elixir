defmodule CodexWeb.ReposController do
  use CodexWeb, :controller

  action_fallback CodexWeb.FallbackController

  def show(conn, %{"login" => login}) do
    with {:ok, repos} <- Codex.retrieve_github_user_repos(login) do
      conn
      |> put_status(:ok)
      |> render("repos.json", repos: repos)
    end
  end
end
