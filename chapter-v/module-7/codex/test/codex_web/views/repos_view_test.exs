defmodule CodexWeb.ReposViewTest do
  use CodexWeb.ConnCase, async: true

  import Phoenix.View
  import Codex.Factory

  alias Codex.Github.Response
  alias CodexWeb.ReposView

  test "renders retrieve.json" do
    new_token = "new-token"

    repos = build_list(1, :repo)

    response = render(ReposView, "retrieve.json", new_token: new_token, repos: repos)

    expected_response = %{
      new_token: new_token,
      repos: [
        %Response{
          id: 161_263_070,
          name: "benchmark",
          description: "Prospecting the libs benchmark",
          html_url: "https://github.com/raulpe7eira/benchmark",
          stargazers_count: 0
        }
      ]
    }

    assert response == expected_response
  end
end
