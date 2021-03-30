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
# creates user
curl -X POST 'http://localhost:4000/api/users' \
-H 'Content-Type: application/json' \
-d '{
    "nome": "Raul",
    "cpf": "20445478055",
    "email": "raul@mail.com"
}'

# retrieves user by id (i.e.: {id} = bca12dd5-0c6b-4fd3-bf1c-100394bf1725)
curl -X GET 'http://localhost:4000/api/users/{id}'

# updates user by id (i.e.: {id} = bca12dd5-0c6b-4fd3-bf1c-100394bf1725)
curl -X PUT 'http://localhost:4000/api/users/{id}' \
-H 'Content-Type: application/json' \
-d '{
    "cpf": "47026165011",
    "email": "fulano@mail.com"
}'

# deletes user by id (i.e.: {id} = bca12dd5-0c6b-4fd3-bf1c-100394bf1725)
curl -X DELETE 'http://localhost:4000/api/users/{id}'

# creates meal (note: replace {user_id} with the respective id)
curl -X POST 'http://localhost:4000/api/meals' \
-H 'Content-Type: application/json' \
-d '{
    "descricao": "Sopa",
    "data": "2021-03-24T18:00:00Z",
    "calorias": 20,
    "user_id": "{user_id}
}'

# retrieves meal by id (i.e.: {id} = bca12dd5-0c6b-4fd3-bf1c-100394bf1725)
curl -X GET 'http://localhost:4000/api/meals/{id}'

# updates meal by id (i.e.: {id} = bca12dd5-0c6b-4fd3-bf1c-100394bf1725)
curl -X PUT 'http://localhost:4000/api/meals/{id}' \
-H 'Content-Type: application/json' \
-d '{
    "data": "2021-03-24T17:00:00Z",
    "calorias": 30
}'

# deletes meal by id (i.e.: {id} = bca12dd5-0c6b-4fd3-bf1c-100394bf1725)
curl -X DELETE 'http://localhost:4000/api/meals/{id}'
```
