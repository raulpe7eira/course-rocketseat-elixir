defmodule Flightex.Bookings.Report do
  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.Booking

  def call(from_date, to_date, filename \\ "report.csv")

  def call(from_date, to_date, filename) when not is_nil(from_date) and not is_nil(to_date) do
    with {:ok, from} <- NaiveDateTime.from_iso8601(from_date),
         {:ok, to} <- NaiveDateTime.from_iso8601(to_date) do
      report = build_report(from, to)
      handle_message(File.write(filename, report))
    else
      _error -> handle_date_error()
    end
  end

  def call(_from_date, _to_date, _filename), do: handle_date_error()

  defp handle_date_error(), do: {:error, "Invalid from date or to date"}

  defp build_report(from, to) do
    BookingAgent.search_in_range(from, to)
    |> Enum.map(fn {_k, booking} -> format_line_csv(booking) end)
  end

  defp format_line_csv(%Booking{} = booking) do
    "#{booking.id_usuario},#{booking.cidade_origem}," <>
      "#{booking.cidade_destino},#{booking.data_completa}\n"
  end

  defp handle_message(:ok), do: {:ok, "Report generated successfully"}

  defp handle_message({:error, _reason}), do: {:error, "Report generated with failure"}
end
