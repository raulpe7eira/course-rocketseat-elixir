# DailyMeals

This code corresponding to the [Ignite, Trilha Elixir](https://app.rocketseat.com.br/ignite/elixir/) lab.

> The project simulates a daily meals register.

## Previous installations

Database, we recommends install [PostgreSQL](https://www.postgresql.org/) with [docker](https://hub.docker.com/_/postgres). After that, sets connection configuration at:
- `config/dev.exs`
- `config/test.exs`

## Gets dependencies, setups database, tests, coverages, reports and starts application

```bash
$ cd course-rocketseat-elixir/chapter-iii/module-4/daily_meals
$ mix deps.get
$ mix ecto.setup
$ mix test
$ mix test --cover
$ mix coveralls.html
$ mix phx.server
```

## How to use?

```bash
# creates meal
curl -X POST 'http://localhost:4000/api/meals' \
-H 'Content-Type: application/json' \
-d '{
    "descricao": "Sopa",
    "data": "2021-03-24T18:00:00Z",
    "calorias": 20
}'

# retrieves meal by id (
#   replaces curly braces:
#     {id} : user identifier
# )
curl -X GET 'http://localhost:4000/api/meals/{id}'

# updates meal by id (
#   replaces curly braces:
#     {id} : user identifier
# )
curl -X PUT 'http://localhost:4000/api/meals/{id}' \
-H 'Content-Type: application/json' \
-d '{
    "data": "2021-03-24T17:00:00Z",
    "calorias": 30
}'

# deletes meal by id (
#   replaces curly braces:
#     {id} : user identifier
# )
curl -X DELETE 'http://localhost:4000/api/meals/{id}'
```
