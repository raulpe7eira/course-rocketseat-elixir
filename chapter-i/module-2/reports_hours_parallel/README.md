# ReportsHoursParallel

This code corresponding to the [Ignite, Trilha Elixir](https://app.rocketseat.com.br/ignite/elixir/) lab.

> The project simulates the processing of csv files for generating reports.

## Compilation, tests and runs

```bash
$ cd course-rocketseat-elixir/chapter-i/module-2/reports_hours_parallel
$ mix compile
$ mix test
$ iex -S mix
```

## How to use?

```elixir
# sum all hours, hours per month and sum hours per year in parallel
iex> ReportsHoursParallel.build(["part-1.csv", "part-2.csv", "part-3.csv"])
```
