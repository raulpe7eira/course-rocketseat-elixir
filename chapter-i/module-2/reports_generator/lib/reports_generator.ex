defmodule ReportsGenerator do
  def build(filename) do
    "reports/#{filename}"
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, result}), do: result
  defp handle_file({:error, reason}), do: reason
end
