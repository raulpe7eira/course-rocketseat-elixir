# Rockelivery

[![codecov](https://codecov.io/gh/raulpe7eira/course-rocketseat-elixir/branch/main/graph/badge.svg?flag=chapter_vi-module_9-rockelivery)](https://codecov.io/gh/raulpe7eira/course-rocketseat-elixir/tree/main/chapter-vi/module-9/rockelivery)

This code corresponding to the [Ignite, Trilha Elixir](https://app.rocketseat.com.br/ignite/elixir/) lab.

> The project that simulates a delivery.

## Previous installations

**Database**, we recommends install [PostgreSQL](https://www.postgresql.org/) with [Docker](https://hub.docker.com/_/postgres). After that, sets connection configuration at:
- `config/dev.exs`
- `config/test.exs`

**PaaS**, we recommends install [Command-Line Interface for Gigalixir](https://gigalixir.readthedocs.io/en/latest/getting-started-guide.html#install-the-command-line-interface). After that, sets release configuration at:
- `config/releases.exs`
- `elixir_buildpack.config`

## Gets dependencies, setups database, tests, coverages, reports and starts application

```bash
$ cd course-rocketseat-elixir/chapter-vi/module-9/rockelivery
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

## How to deploy?

```bash
# locally
# ======================

# sets environment variables (
#   replaces curly braces:
#     {user} : database username
#     {pass} : database password
#     {db} : database name
#     {app} : application name
# )
export SECRET_KEY_BASE="$(mix phx.gen.secret)"
export DATABASE_URL="postgresql://{user}:{pass}@localhost:5432/{db}"
MIX_ENV=prod 
APP_NAME={app}
PORT=4000

# build release
mix release

# runs release
_build/prod/rel/$APP_NAME/bin/$APP_NAME start

# remotily in Gigalixir
# ======================

# creates app
gigalixir create

# provision a database
gigalixir pg:create --free
gigalixir config

# deploy!
git -c http.extraheader="GIGALIXIR-CLEAN: true" subtree push -P chapter-vi/module-9/rockelivery/ gigalixir master
gigalixir ps

# generate gigalixir ssh key called gigalixir_rsa (
#   without password when use in github action
# )
ssh-keygen -t rsa -b 4096 -C "Gigalixir SSH Key"

# adds ssh key generated
gigalixir account:ssh_keys:add "$(cat gigalixir_rsa.pub)"

# runs migrations with ssh key generated (
#   replaces curly braces:
#     {app} : application name return by `gigalixir create`
# )
gigalixir ps:migrate -a {app} -o "-i gigalixir_rsa"

# runs remote console
gigalixir ps:remote_console

# runs seeds in remote console
seed_script = Path.join(["#{:code.priv_dir(:rockelivery)}", "repo", "seeds.exs"])
Code.eval_file(seed_script)
```

> The [`Dockerfile`](../rockelivery/Dockerfile), which is at the root of the project, is an example to use in another PaaS.

# Uses in prodution

:rocket: https://thrifty-madeup-jaguar.gigalixirapp.com/api
