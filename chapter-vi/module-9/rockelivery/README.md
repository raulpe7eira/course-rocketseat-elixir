# Rockelivery

This code corresponding to the [Ignite, Trilha Elixir](https://app.rocketseat.com.br/ignite/elixir/) lab.

> The project that simulates a delivery.

## Previous installations

Database, we recommends install [PostgreSQL](https://www.postgresql.org/) with [docker](https://hub.docker.com/_/postgres). After that, sets connection configuration at:
- `config/dev.exs`
- `config/test.exs`

## Gets dependencies, setups database, tests, coverages and starts application

```bash
$ cd course-rocketseat-elixir/chapter-vi/module-9/rockelivery
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

# signs in user
curl -X POST 'http://localhost:4000/api/users/sign-in' \
-H 'Content-Type: application/json' \
-d '{
    "id": "bca12dd5-0c6b-4fd3-bf1c-100394bf1725",
    "password": "111111"
}'

# retrieves user by id (
#   replaces curly braces:
#     {id} : user identifier
#     {token} : authorization token
# )
curl -X GET 'http://localhost:4000/api/users/{id}' \
-H 'Authorization: {token}'

# updates user by id (
#   replaces curly braces:
#     {id} : user identifier
#     {token} : authorization token
# )
curl -X PUT 'http://localhost:4000/api/users/{id}' \
-H 'Authorization: {token}' \
-H 'Content-Type: application/json' \
-d '{
    "age": 30,
    "password": "aaaaaa"
}'

# deletes user by id (
#   replaces curly braces:
#     {id} : user identifier
#     {token} : authorization token
# )
curl -X DELETE 'http://localhost:4000/api/users/{id}'
-H 'Authorization: {token}'

# creates item (
#   replaces curly braces:
#     {token} : authorization token
# )
curl -X POST 'http://localhost:4000/api/items' \
-H 'Authorization: {token}' \
-H 'Content-Type: application/json' \
-d '{
    "category": "food",
    "description": "Arroz & feijão",
    "price": "10.00",
    "photo": "/priv/photos/arroz_feijao.jpg"
}'

# creates order (
#   replaces curly braces:
#     {token} : authorization token
#     {user_id} : user identifier
#     {item_id} : item identifier
# )
curl -X POST 'http://localhost:4000/api/orders' \
-H 'Authorization: {token}' \
-H 'Content-Type: application/json' \
-d '{
    "address": "Rua X, 123",
    "comments": "Com bacon",
    "payment_method": "credit_card",
    "user_id": "{user_id}",
    "items": [
        {
            "id": "{item_id}",
            "quantity": 2
        },
        {
            "id": "{item_id}",
            "quantity": 3
        }
    ]
}'
```

## Background processing

An order report file is created every 10 seconds through the generic server ([`ReportRunner`](../rockelivery/lib/rockelivery/orders/report_runner.ex)).

```bash
# Default path and filename
./report.csv
```
