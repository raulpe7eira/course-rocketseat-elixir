defmodule Codex.ReposControllerTest do
  use CodexWeb.ConnCase, async: true

  import Mox
  import Codex.Factory

  alias Codex.Error
  alias Codex.Github.ClientMock
  alias CodexWeb.Auth.Guardian

  @login "raulpe7eira"
  @not_found_login "not-found"

  describe "show/2" do
    setup %{conn: conn} do
      user = insert(:user)
      {:ok, token, _claims} = Guardian.encode_and_sign(user)
      conn = put_req_header(conn, "authorization", "Bearer #{token}")

      {:ok, conn: conn}
    end

    test "when all params are valid, show the repos", %{conn: conn} do
      expect(ClientMock, :user_repos, fn @login ->
        {:ok, build_list(1, :repo)}
      end)

      response =
        conn
        |> get(Routes.repos_path(conn, :show, @login))
        |> json_response(:ok)

      expected_response = %{
        "repos" => [
          %{
            "id" => 161_263_070,
            "name" => "benchmark",
            "description" => "Prospecting the libs benchmark",
            "html_url" => "https://github.com/raulpe7eira/benchmark",
            "stargazers_count" => 0
          }
        ]
      }

      assert response == expected_response
    end

    test "when thre is no repos with given login, returns an error", %{conn: conn} do
      expect(ClientMock, :user_repos, fn @not_found_login ->
        {:error, Error.build(:not_found, "Login not found!")}
      end)

      response =
        conn
        |> get(Routes.repos_path(conn, :show, @not_found_login))
        |> json_response(:not_found)

      expected_response = %{"detail" => "Login not found!", "message" => "Falha na requisição!"}

      assert response == expected_response
    end
  end
end
