defmodule Codex.Github.ClientTest do
  use ExUnit.Case, async: true

  alias Plug.Conn
  alias Codex.Error
  alias Codex.Github.{Client, Response}

  describe "user_repos/1" do
    setup do
      bypass = Bypass.open()

      {:ok, bypass: bypass}
    end

    test "when there is a generic error, returns an error", %{bypass: bypass} do
      url = endpoint_url(bypass.port)

      login = "00000000"

      Bypass.down(bypass)

      response = Client.user_repos(url, login)

      expected_response = {:error, %Error{status: :bad_request, result: :econnrefused}}

      assert response == expected_response
    end

    test "when the login was not found, returns an error", %{bypass: bypass} do
      url = endpoint_url(bypass.port)

      login = "login-not-exist"

      body = ~s({
        "message": "Not Found",
        "documentation_url": "https://docs.github.com/rest/reference/repos#list-repositories-for-a-user"
      })

      Bypass.expect(bypass, "GET", "/users/#{login}/repos", fn conn ->
        conn
        |> Conn.put_resp_header("content-type", "application/json")
        |> Conn.resp(404, body)
      end)

      response = Client.user_repos(url, login)

      expected_response = {:error, %Error{status: :not_found, result: "Login not found!"}}

      assert response == expected_response
    end

    test "when there is a valid login, returns the repos", %{bypass: bypass} do
      url = endpoint_url(bypass.port)

      login = "raulpe7eira"

      body = ~s([{
        "id": 161263070,
        "node_id": "MDEwOlJlcG9zaXRvcnkxNjEyNjMwNzA=",
        "name": "benchmark",
        "full_name": "raulpe7eira/benchmark",
        "private": false,
        "owner": {
            "login": "raulpe7eira",
            "id": 456260,
            "node_id": "MDQ6VXNlcjQ1NjI2MA==",
            "avatar_url": "https://avatars.githubusercontent.com/u/456260?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/raulpe7eira",
            "html_url": "https://github.com/raulpe7eira",
            "followers_url": "https://api.github.com/users/raulpe7eira/followers",
            "following_url": "https://api.github.com/users/raulpe7eira/following{/other_user}",
            "gists_url": "https://api.github.com/users/raulpe7eira/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/raulpe7eira/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/raulpe7eira/subscriptions",
            "organizations_url": "https://api.github.com/users/raulpe7eira/orgs",
            "repos_url": "https://api.github.com/users/raulpe7eira/repos",
            "events_url": "https://api.github.com/users/raulpe7eira/events{/privacy}",
            "received_events_url": "https://api.github.com/users/raulpe7eira/received_events",
            "type": "User",
            "site_admin": false
        },
        "html_url": "https://github.com/raulpe7eira/benchmark",
        "description": "Prospecting the libs benchmark",
        "fork": false,
        "url": "https://api.github.com/repos/raulpe7eira/benchmark",
        "forks_url": "https://api.github.com/repos/raulpe7eira/benchmark/forks",
        "keys_url": "https://api.github.com/repos/raulpe7eira/benchmark/keys{/key_id}",
        "collaborators_url": "https://api.github.com/repos/raulpe7eira/benchmark/collaborators{/collaborator}",
        "teams_url": "https://api.github.com/repos/raulpe7eira/benchmark/teams",
        "hooks_url": "https://api.github.com/repos/raulpe7eira/benchmark/hooks",
        "issue_events_url": "https://api.github.com/repos/raulpe7eira/benchmark/issues/events{/number}",
        "events_url": "https://api.github.com/repos/raulpe7eira/benchmark/events",
        "assignees_url": "https://api.github.com/repos/raulpe7eira/benchmark/assignees{/user}",
        "branches_url": "https://api.github.com/repos/raulpe7eira/benchmark/branches{/branch}",
        "tags_url": "https://api.github.com/repos/raulpe7eira/benchmark/tags",
        "blobs_url": "https://api.github.com/repos/raulpe7eira/benchmark/git/blobs{/sha}",
        "git_tags_url": "https://api.github.com/repos/raulpe7eira/benchmark/git/tags{/sha}",
        "git_refs_url": "https://api.github.com/repos/raulpe7eira/benchmark/git/refs{/sha}",
        "trees_url": "https://api.github.com/repos/raulpe7eira/benchmark/git/trees{/sha}",
        "statuses_url": "https://api.github.com/repos/raulpe7eira/benchmark/statuses/{sha}",
        "languages_url": "https://api.github.com/repos/raulpe7eira/benchmark/languages",
        "stargazers_url": "https://api.github.com/repos/raulpe7eira/benchmark/stargazers",
        "contributors_url": "https://api.github.com/repos/raulpe7eira/benchmark/contributors",
        "subscribers_url": "https://api.github.com/repos/raulpe7eira/benchmark/subscribers",
        "subscription_url": "https://api.github.com/repos/raulpe7eira/benchmark/subscription",
        "commits_url": "https://api.github.com/repos/raulpe7eira/benchmark/commits{/sha}",
        "git_commits_url": "https://api.github.com/repos/raulpe7eira/benchmark/git/commits{/sha}",
        "comments_url": "https://api.github.com/repos/raulpe7eira/benchmark/comments{/number}",
        "issue_comment_url": "https://api.github.com/repos/raulpe7eira/benchmark/issues/comments{/number}",
        "contents_url": "https://api.github.com/repos/raulpe7eira/benchmark/contents/{+path}",
        "compare_url": "https://api.github.com/repos/raulpe7eira/benchmark/compare/{base}...{head}",
        "merges_url": "https://api.github.com/repos/raulpe7eira/benchmark/merges",
        "archive_url": "https://api.github.com/repos/raulpe7eira/benchmark/{archive_format}{/ref}",
        "downloads_url": "https://api.github.com/repos/raulpe7eira/benchmark/downloads",
        "issues_url": "https://api.github.com/repos/raulpe7eira/benchmark/issues{/number}",
        "pulls_url": "https://api.github.com/repos/raulpe7eira/benchmark/pulls{/number}",
        "milestones_url": "https://api.github.com/repos/raulpe7eira/benchmark/milestones{/number}",
        "notifications_url": "https://api.github.com/repos/raulpe7eira/benchmark/notifications{?since,all,participating}",
        "labels_url": "https://api.github.com/repos/raulpe7eira/benchmark/labels{/name}",
        "releases_url": "https://api.github.com/repos/raulpe7eira/benchmark/releases{/id}",
        "deployments_url": "https://api.github.com/repos/raulpe7eira/benchmark/deployments",
        "created_at": "2018-12-11T02:06:05Z",
        "updated_at": "2018-12-12T16:14:08Z",
        "pushed_at": "2018-12-11T03:03:01Z",
        "git_url": "git://github.com/raulpe7eira/benchmark.git",
        "ssh_url": "git@github.com:raulpe7eira/benchmark.git",
        "clone_url": "https://github.com/raulpe7eira/benchmark.git",
        "svn_url": "https://github.com/raulpe7eira/benchmark",
        "homepage": "",
        "size": 60,
        "stargazers_count": 0,
        "watchers_count": 0,
        "language": "Kotlin",
        "has_issues": false,
        "has_projects": false,
        "has_downloads": true,
        "has_wiki": false,
        "has_pages": false,
        "forks_count": 0,
        "mirror_url": null,
        "archived": false,
        "disabled": false,
        "open_issues_count": 0,
        "license": {
            "key": "mit",
            "name": "MIT License",
            "spdx_id": "MIT",
            "url": "https://api.github.com/licenses/mit",
            "node_id": "MDc6TGljZW5zZTEz"
        },
        "forks": 0,
        "open_issues": 0,
        "watchers": 0,
        "default_branch": "master"
      }])

      Bypass.expect(bypass, "GET", "/users/#{login}/repos", fn conn ->
        conn
        |> Conn.put_resp_header("content-type", "application/json")
        |> Conn.resp(200, body)
      end)

      response = Client.user_repos(url, login)

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

    defp endpoint_url(port), do: "http://localhost:#{port}"
  end
end
