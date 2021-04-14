# Queue

[![codecov](https://codecov.io/gh/raulpe7eira/course-rocketseat-elixir/branch/main/graph/badge.svg?flag=chapter_v-module_8-queue)](https://codecov.io/gh/raulpe7eira/course-rocketseat-elixir/tree/main/chapter-v/module-8/queue)

This code corresponding to the [Ignite, Trilha Elixir](https://app.rocketseat.com.br/ignite/elixir/) lab.

> The project simulates queue service.

## Compilation, tests, coverages, reports and runs

```bash
$ cd course-rocketseat-elixir/chapter-v/module-8/queue
$ mix compile
$ mix test
$ mix test --cover
$ mix coveralls.html
$ iex -S mix
```

## How to use?

```elixir
# start queue service
iex> {:ok, pid} = Queue.start_link([1,2,3])

# enqueue element
iex> Queue.enqueue(pid, 5)

# dequeue element
iex> Queue.dequeue(pid)
```
