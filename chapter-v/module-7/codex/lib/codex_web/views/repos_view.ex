defmodule CodexWeb.ReposView do
  use CodexWeb, :view

  def render("retrieve.json", %{new_token: new_token, repos: repos}) do
    %{new_token: new_token, repos: repos}
  end
end
