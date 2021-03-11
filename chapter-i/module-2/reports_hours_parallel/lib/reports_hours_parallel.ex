defmodule ReportsHoursParallel do
  alias ReportsHoursParallel.{Parser, Report}

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

  def build(file_names) when not is_list(file_names),
    do: {:error, "Please provide a list of strings"}

  def build(file_names) do
    result =
      file_names
      |> Task.async_stream(&build_file/1)
      |> Enum.reduce(%Report{}, fn {:ok, result}, report -> sum_reports(report, result) end)
      |> Map.from_struct()

    {:ok, result}
  end

  defp build_file(file_name) do
    file_name
    |> Parser.parse_file()
    |> Enum.reduce(%Report{}, fn line, report -> sum_hours(line, report) end)
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

  defp sum_reports(%Report{} = report1, %Report{} = report2) do
    %Report{
      all_hours: merge_all_hours(report1.all_hours, report2.all_hours),
      hours_per_month: merge_hours_per(report1.hours_per_month, report2.hours_per_month),
      hours_per_year: merge_hours_per(report1.hours_per_year, report2.hours_per_year)
    }
  end

  defp merge_all_hours(map1, map2) do
    Map.merge(map1, map2, fn _key, value1, value2 -> value1 + value2 end)
  end

  defp merge_hours_per(map1, map2) do
    Map.merge(map1, map2, fn _key, sub_map1, sub_map2 ->
      Map.merge(sub_map1, sub_map2, fn _key, value1, value2 -> value1 + value2 end)
    end)
  end
end
