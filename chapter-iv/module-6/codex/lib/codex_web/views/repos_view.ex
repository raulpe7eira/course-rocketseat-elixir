defmodule CodexWeb.ReposView do
  use CodexWeb, :view

  def render("retrieve.json", %{repos: repos}), do: %{repos: repos}
end
