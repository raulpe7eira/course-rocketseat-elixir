defmodule Codex.Repos.RetrieveTest do
  use ExUnit.Case, async: true

  import Mox
  import Codex.Factory

  alias Codex.Error
  alias Codex.Github.{ClientMock, Response}
  alias Codex.Repos.Retrieve

  @login "raulpe7eira"
  @not_found_login "not-found"

  describe "github_call/1" do
    test "when all params are valid, returns the repos" do
      expect(ClientMock, :user_repos, fn @login ->
        {:ok, build_list(1, :repo)}
      end)

      response = Retrieve.github_call(@login)

      expected_response =
        {:ok,
         [
           %Response{
             id: 161_263_070,
             name: "benchmark",
             description: "Prospecting the libs benchmark",
             html_url: "https://github.com/raulpe7eira/benchmark",
             stargazers_count: 0
           }
         ]}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      expect(ClientMock, :user_repos, fn @not_found_login ->
        {:error, Error.build(:not_found, "Login not found!")}
      end)

      response = Retrieve.github_call(@not_found_login)

      expected_response =
        {:error,
         %Error{
           status: :not_found,
           result: "Login not found!"
         }}

      assert response == expected_response
    end
  end
end
