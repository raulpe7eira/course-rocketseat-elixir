defmodule CodexWeb.FallbackController do
  use CodexWeb, :controller

  alias Codex.Error
  alias CodexWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
