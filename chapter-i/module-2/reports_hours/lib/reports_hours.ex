defmodule ReportsHours do
  alias ReportsHours.{Parser, Report}

  @available_months [
    "janeiro",
    "fevereiro",
    "março",
    "abril",
    "maio",
    "junho",
    "julho",
    "agosto",
    "setembro",
    "outubro",
    "novembro",
    "dezembro"
  ]

  def build(file_name) do
    file_name
    |> Parser.parse_file()
    |> Enum.reduce(%Report{}, fn line, report -> sum_hours(line, report) end)
    |> Map.from_struct()
  end

  defp sum_hours([name, hours, _day, month, year], %Report{} = report) do
    %Report{
      all_hours:
        sum_all_hours(
          report.all_hours,
          name,
          hours
        ),
      hours_per_month:
        sum_hours_per(
          report.hours_per_month,
          name,
          month_name(month),
          default_hours_per_month(),
          hours
        ),
      hours_per_year:
        sum_hours_per(
          report.hours_per_year,
          name,
          year,
          default_hours_per_year(),
          hours
        )
    }
  end

  defp sum_all_hours(all_hours, name, hours), do: Map.update(all_hours, name, 0, &(&1 + hours))

  defp sum_hours_per(map, key, sub_key, default, hours) do
    Map.update(map, key, default, fn value ->
      Map.update(value, sub_key, 0, &(&1 + hours))
    end)
  end

  defp default_hours_per_month, do: Enum.into(@available_months, %{}, &{&1, 0})

  defp default_hours_per_year, do: Enum.into(2016..2020, %{}, &{&1, 0})

  defp month_name(month), do: Enum.at(@available_months, month - 1)
end
