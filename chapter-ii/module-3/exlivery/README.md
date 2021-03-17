# Exlivery

This code corresponding to the [Ignite, Trilha Elixir](https://app.rocketseat.com.br/ignite/elixir/) lab.

> The project simulates order requests for delivery and generates a csv report.

## Compilation, tests and runs

```bash
$ cd course-rocketseat-elixir/chapter-ii/module-3/exlivery
$ mix compile
$ mix test
$ iex -S mix
```

## How to use?

```elixir
# start agents to simulate a memory database
iex> Exlivery.start_agents()

# creates or updates an user
iex> Exlivery.create_or_update_user(%{name: "Raul", address: "Rua sem fim", email: "raul@mail.com", cpf: "65977019092", age: 40})

# creates or updates an order
iex> Exlivery.create_or_update_order(%{user_cpf: "65977019092", items: [%{description: "Pizza de peperoni", category: :pizza, unity_price: "50.0", quantity: 1}, %{description: "Pizza de calabresa", category: :pizza, unity_price: "45.0", quantity: 2}]})

# creates a report for all orders (generates csv)
iex> Exlivery.create_report_for_all_orders("report_test.csv")
```
