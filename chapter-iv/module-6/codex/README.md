# Codex

[![codecov](https://codecov.io/gh/raulpe7eira/course-rocketseat-elixir/branch/main/graph/badge.svg?flag=chapter_iv-module_6-codex)](https://codecov.io/gh/raulpe7eira/course-rocketseat-elixir/tree/main/chapter-iv/module-6/codex)

This code corresponding to the [Ignite, Trilha Elixir](https://app.rocketseat.com.br/ignite/elixir/) lab.

> The project simulates a repositories client.

## Gets dependencies, tests, coverages, reports and starts application

```bash
$ cd course-rocketseat-elixir/chapter-iv/module-6/codex
$ mix deps.get
$ mix test
$ mix test --cover
$ mix coveralls.html
$ mix phx.server
```

## How to use?

```bash
# retrieves github repos by user login (
#   replaces curly braces:
#     {login} : github user login
# )
curl -X GET 'http://localhost:4000/api/repos/github/users/{login}'
```
