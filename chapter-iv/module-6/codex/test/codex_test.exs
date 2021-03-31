defmodule CodexTest do
  use ExUnit.Case, async: true

  import Mox
  import Codex.Factory

  alias Codex.Github.ClientMock

  @login "raulpe7eira"

  describe "retrieves" do
    test "github user repos" do
      expect(ClientMock, :user_repos, fn @login -> {:ok, build_list(1, :repo)} end)

      response = Codex.retrieve_github_user_repos(@login)

      expected_response =
        {:ok,
         [
           %Codex.Github.Response{
             id: 161_263_070,
             name: "benchmark",
             description: "Prospecting the libs benchmark",
             html_url: "https://github.com/raulpe7eira/benchmark",
             stargazers_count: 0
           }
         ]}

      assert response == expected_response
    end
  end
end
