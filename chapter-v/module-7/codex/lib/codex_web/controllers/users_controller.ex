defmodule CodexWeb.UsersController do
  use CodexWeb, :controller

  alias Codex.Users.User
  alias CodexWeb.Auth.Guardian
  alias CodexWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Codex.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  def login(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("login.json", token: token)
    end
  end
end
