defmodule Codex.Github.Client do
  @behaviour Codex.Github.Behaviour

  use Tesla

  alias Codex.Error
  alias Codex.Github.Response
  alias Tesla.Env

  @base_url "https://api.github.com"

  plug Tesla.Middleware.Headers, [{"User-Agent", "request"}]
  plug Tesla.Middleware.JSON

  def user_repos(url \\ @base_url, login) do
    "#{url}/users/#{login}/repos"
    |> get()
    |> handle_get()
  end

  defp handle_get({:error, reason}) do
    {:error, Error.build(:bad_request, reason)}
  end

  defp handle_get({:ok, %Env{status: 404, body: %{"message" => "Not Found"}}}) do
    {:error, Error.build(:not_found, "User not found!")}
  end

  defp handle_get({:ok, %Env{status: 200, body: repos}}) do
    {:ok, Enum.map(repos, fn item -> Response.build(item) end)}
  end
end
