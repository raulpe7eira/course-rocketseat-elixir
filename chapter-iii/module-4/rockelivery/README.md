# Rockelivery

[![codecov](https://codecov.io/gh/raulpe7eira/course-rocketseat-elixir/branch/main/graph/badge.svg?flag=chapter_iii-module_4-rockelivery)](https://codecov.io/gh/raulpe7eira/course-rocketseat-elixir/tree/main/chapter-iii/module-4/rockelivery)

This code corresponding to the [Ignite, Trilha Elixir](https://app.rocketseat.com.br/ignite/elixir/) lab.

> The project that simulates a delivery.

## Previous installations

Database, we recommends install [PostgreSQL](https://www.postgresql.org/) with [docker](https://hub.docker.com/_/postgres). After that, sets connection configuration at:
- `config/dev.exs`
- `config/test.exs`

## Gets dependencies, setups database, tests, coverages and starts application

```bash
$ cd course-rocketseat-elixir/chapter-iii/module-4/rockelivery
$ mix deps.get
$ mix ecto.setup
$ mix test
$ mix test --cover
$ mix phx.server
```

## How to use?

```bash
# creates user
curl -X POST 'http://localhost:4000/api/users' \
-H 'Content-Type: application/json' \
-d '{
    "address": "Rua X, 123",
    "age": 40,
    "cep": "12312312",
    "cpf": "87482510036",
    "email": "raul@mail.com",
    "password": "111111",
    "name": "Raul"
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
    "age": 30,
    "password": "aaaaaa"
}'

# deletes user by id (
#   replaces curly braces:
#     {id} : user identifier
# )
curl -X DELETE 'http://localhost:4000/api/users/{id}'
```
