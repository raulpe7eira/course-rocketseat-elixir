# ListFilter

This code corresponding to the [Ignite, Trilha Elixir](https://app.rocketseat.com.br/ignite/elixir/) lab.

> The project simulates the odd number filter received.

## Compilation, tests and runs

```bash
$ cd course-rocketseat-elixir/chapter-i/module-1/list_filter
$ mix compile
$ mix test
$ iex -S mix
```

## How to use?

```elixir
# counts the odd numbers in a list
iex> ListFilter.call(["1", "3", "6", "43", "banana", "6", "abc"])
