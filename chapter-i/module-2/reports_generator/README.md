# ReportsGenerator

This code corresponding to the [Ignite, Trilha Elixir](https://app.rocketseat.com.br/ignite/elixir/) lab.

> The project simulates the processing of csv files for generating reports.

## Compilation, tests and runs

```bash
$ cd course-rocketseat-elixir/chapter-i/module-2/reports_generator
$ mix compile
$ mix test
$ iex -S mix
```

## How to use?

```elixir
# sum order values and count frequency of each order (non-parallelized version)
iex> ReportsGenerator.build("report_complete.csv")

# sum order values and count frequency of each order (parallelized version)
iex> ReportsGenerator.build_from_many(["report_1.csv", "report_2.csv", "report_3.csv"])

# fetch higher cost by foods
iex> report = ReportsGenerator.build("report_complete.csv")
iex> ReportsGenerator.fetch_higher_cost(report, "foods")

# fetch higher cost by users
iex> report = ReportsGenerator.build("report_complete.csv")
iex> ReportsGenerator.fetch_higher_cost(report, "users")

# benchmark between non-parallelized and parallelized build
iex> :timer.tc(fn -> ReportsGenerator.build("report_complete.csv") end)
iex> :timer.tc(fn -> ReportsGenerator.build_from_many(["report_1.csv", "report_2.csv", "report_3.csv"]) end)
```
