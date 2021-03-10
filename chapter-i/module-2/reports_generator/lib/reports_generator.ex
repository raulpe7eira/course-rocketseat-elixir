defmodule ReportsGenerator do
  alias ReportsGenerator.Parser

  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(init_report(), fn line, report -> sum_values(line, report) end)
  end

  defp init_report, do: Enum.into(1..30, %{}, &{Integer.to_string(&1), 0})

  defp sum_values([id, _food_name, price], report), do: Map.put(report, id, report[id] + price)
end
