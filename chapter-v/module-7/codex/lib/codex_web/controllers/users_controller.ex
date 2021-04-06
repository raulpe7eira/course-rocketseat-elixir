defmodule CodexWeb.UsersController do
  use CodexWeb, :controller

  alias Codex.Users.User
  alias CodexWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Codex.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
