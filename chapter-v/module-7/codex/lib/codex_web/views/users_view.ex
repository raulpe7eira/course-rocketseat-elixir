defmodule CodexWeb.UsersView do
  use CodexWeb, :view

  alias Codex.Users.User

  def render("create.json", %{user: %User{} = user}) do
    %{message: "User created!", detail: %{user: user}}
  end

  def render("token.json", %{token: token}), do: %{token: token}
end
