# Flightex

This code corresponding to the [Ignite, Trilha Elixir](https://app.rocketseat.com.br/ignite/elixir/) lab.

> The project simulates flight bookings.

## Compilation, tests and runs

```bash
$ cd course-rocketseat-elixir/chapter-ii/module-3/flightex
$ mix compile
$ mix test
$ iex -S mix
```

## How to use?

```elixir
# start agents to simulate a memory database
iex> Flightex.start_agents()

# creates an user
iex> {:ok, user_id} = Flightex.create_user(%{name: "Raul", email: "raul@mail.com", cpf: "65977019092"})

# creates a booking
iex> {:ok, booking_id} = Flightex.create_booking(user_id, %{data_completa: "2021-03-17T11:00:00.000Z", cidade_origem: "Rio de Janeiro", cidade_destino: "São Paulo"})

# gets a booking
iex> Flightex.get_booking(booking_id)
```
