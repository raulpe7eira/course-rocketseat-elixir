# ListLength

This code corresponding to the [Ignite, Trilha Elixir](https://app.rocketseat.com.br/ignite/elixir/) lab.

> The project simulates a list size counter.

## Compilation, tests, coverages and runs

```bash
$ cd course-rocketseat-elixir/chapter-i/module-1/list_length
$ mix compile
$ mix test
$ mix test --cover
$ iex -S mix
```

## How to use?

```elixir
# counts the length of the list
iex> ListLength.call([1, 2, 3, 5, 7])
