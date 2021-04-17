# DailyMeals

[![codecov](https://codecov.io/gh/raulpe7eira/course-rocketseat-elixir/branch/main/graph/badge.svg?flag=chapter_iv-module_5-daily_meals)](https://codecov.io/gh/raulpe7eira/course-rocketseat-elixir/tree/main/chapter-iv/module-5/daily_meals)

This code corresponding to the [Ignite, Trilha Elixir](https://app.rocketseat.com.br/ignite/elixir/) lab.

> The project simulates a daily meals register.

## Previous installations

**Database**, we recommends install [PostgreSQL](https://www.postgresql.org/) with [Docker](https://hub.docker.com/_/postgres). After that, sets connection configuration at:
- `config/dev.exs`
- `config/test.exs`

## Gets dependencies, setups database, tests, coverages, reports and starts application

```bash
$ cd course-rocketseat-elixir/chapter-iv/module-5/daily_meals
$ mix deps.get
$ mix ecto.setup
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
    "nome": "Raul",
    "cpf": "20445478055",
    "email": "raul@mail.com"
}'

# retrieves user by id (
#   replaces curly braces:
#     {id} : user identifier
# )
curl -X GET 'http://localhost:4000/api/users/{id}'

# updates user by id (
#   replaces curly braces:
#     {id} : user identifier
# )
curl -X PUT 'http://localhost:4000/api/users/{id}' \
-H 'Content-Type: application/json' \
-d '{
    "cpf": "47026165011",
    "email": "fulano@mail.com"
}'

# deletes user by id (
#   replaces curly braces:
#     {id} : user identifier
# )
curl -X DELETE 'http://localhost:4000/api/users/{id}'

# creates meal (
#   replaces curly braces:
#     {user_id} : user identifier
# )
curl -X POST 'http://localhost:4000/api/meals' \
-H 'Content-Type: application/json' \
-d '{
    "descricao": "Sopa",
    "data": "2021-03-24T18:00:00Z",
    "calorias": 20,
    "user_id": "{user_id}
}'

# retrieves meal by id (
#   replaces curly braces:
#     {id} : meal identifier
# )
curl -X GET 'http://localhost:4000/api/meals/{id}'

# updates meal by id (
#   replaces curly braces:
#     {id} : meal identifier
# )
curl -X PUT 'http://localhost:4000/api/meals/{id}' \
-H 'Content-Type: application/json' \
-d '{
    "data": "2021-03-24T17:00:00Z",
    "calorias": 30
}'

# deletes meal by id (
#   replaces curly braces:
#     {id} : meal identifier
# )
curl -X DELETE 'http://localhost:4000/api/meals/{id}'
```
