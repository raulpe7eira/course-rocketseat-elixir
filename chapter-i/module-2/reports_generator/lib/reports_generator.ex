defmodule ReportsGenerator do
  alias ReportsGenerator.Parser

  @available_foods [
    "açaí",
    "churrasco",
    "esfirra",
    "hambúrguer",
    "pastel",
    "pizza",
    "prato_feito",
    "sushi"
  ]

  @options ["foods", "users"]

  def build(file_name) do
    file_name
    |> Parser.parse_file()
    |> Enum.reduce(init_report(), fn line, report -> sum_values(line, report) end)
  end

  def build_from_many(file_names) when not is_list(file_names), do: {:error, "Please provide a list of strings"}

  def build_from_many(file_names) do
    result =
      file_names
      |> Task.async_stream(&build/1)
      |> Enum.reduce(init_report(), fn {:ok, result}, report -> sum_reports(report, result) end)

    {:ok, result}
  end

  def fetch_higher_cost(report, option) when option in @options do
    {:ok, Enum.max_by(report[option], fn {_key, value} -> value end)}
  end

  def fetch_higher_cost(_report, _option), do: {:error, "Invalid option!"}

  defp init_report do
    foods = Enum.into(@available_foods, %{}, &{&1, 0})
    users = Enum.into(1..30, %{}, &{Integer.to_string(&1), 0})

    build_report(foods, users)
  end

  defp sum_values([id, food_name, price], %{"foods" => foods, "users" => users}) do
    foods = Map.put(foods, food_name, foods[food_name] + 1)
    users = Map.put(users, id, users[id] + price)

    build_report(foods, users)
  end

  defp sum_reports(%{"foods" => foods1, "users" => users1}, %{"foods" => foods2, "users" => users2}) do
    foods = merge_maps(foods1, foods2)
    users = merge_maps(users1, users2)

    build_report(foods, users)
  end

  defp merge_maps(map1, map2), do: Map.merge(map1, map2, fn _key, value1, value2 -> value1 + value2 end)

  defp build_report(foods, users), do: %{"foods" => foods, "users" => users}
end
