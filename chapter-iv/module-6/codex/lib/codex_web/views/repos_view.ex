defmodule CodexWeb.ReposView do
  use CodexWeb, :view

  def render("repos.json", %{repos: repos}), do: %{repos: repos}
end
