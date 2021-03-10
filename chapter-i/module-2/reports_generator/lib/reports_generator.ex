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

  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(init_report(), fn line, report -> sum_values(line, report) end)
  end

  def fetch_higher_cost(report), do: Enum.max_by(report, fn {_key, value} -> value end)

  defp init_report do
    foods = Enum.into(@available_foods, %{}, &{&1, 0})
    users = Enum.into(1..30, %{}, &{Integer.to_string(&1), 0})

    %{"users" => users, "foods" => foods}
  end

  defp sum_values([id, food_name, price], %{"foods" => foods, "users" => users} = report) do
    foods = Map.put(foods, food_name, foods[food_name] + 1)
    users = Map.put(users, id, users[id] + price)

    report
    |> Map.put("foods", foods)
    |> Map.put("users", users)
  end
end
