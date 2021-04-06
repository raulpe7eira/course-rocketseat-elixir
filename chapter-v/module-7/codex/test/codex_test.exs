defmodule CodexTest do
  use Codex.DataCase, async: true

  import Mox
  import Codex.Factory

  alias Codex.Users.User
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

  describe "user" do
    test "creates" do
      params = build(:user_params)

      response = Codex.create_user(params)

      assert {:ok,
              %User{
                id: _id,
                inserted_at: _inserted_at,
                updated_at: _updated_at
              }} = response
    end
  end
end
