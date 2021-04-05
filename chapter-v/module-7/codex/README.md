# Codex

This code corresponding to the [Ignite, Trilha Elixir](https://app.rocketseat.com.br/ignite/elixir/) lab.

> The project simulates a repositories client.

## Gets dependencies, tests, coverages, reports and starts application

```bash
$ cd course-rocketseat-elixir/chapter-v/module-7/codex
$ mix deps.get
$ mix test
$ mix test --cover
$ mix coveralls.html
$ mix phx.server
```

## How to use?

```bash
# retrieves github repos by user login (i.e.: {login} = raulpe7eira)
curl -X GET 'http://localhost:4000/api/repos/github/users/{login}'
```
