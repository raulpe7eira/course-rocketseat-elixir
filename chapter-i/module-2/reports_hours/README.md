# ReportsHours

This code corresponding to the [Ignite, Trilha Elixir](https://app.rocketseat.com.br/ignite/elixir/) lab.

> The project simulates the processing of csv files for generating reports.

## Compilation, tests and runs

```bash
$ cd course-rocketseat-elixir/chapter-i/module-2/reports_hours
$ mix compile
$ mix test
$ iex -S mix
```

## How to use?

```elixir
# sum all hours, hours per month and sum hours per year
iex> ReportsHours.build("gen_report.csv")
```
