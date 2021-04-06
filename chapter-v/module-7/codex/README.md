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
# creates user
curl -X POST 'http://localhost:4000/api/users' \
-H 'Content-Type: application/json' \
-d '{
    "password": "123456"
}'

# logins user
curl -X POST 'http://localhost:4000/api/users/login' \
-H 'Content-Type: application/json' \
-d '{
    "id": "bca12dd5-0c6b-4fd3-bf1c-100394bf1725",
    "password": "123456"
}'

# retrieves github repos by user login (
#   replaces curly braces:
#     {login} : github user login
#     {token} : authorization token
# )
curl -X GET 'http://localhost:4000/api/repos/github/users/{login}' \
-H 'Authorization: {token}'
```
