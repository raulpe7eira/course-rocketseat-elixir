defmodule Flightex.Bookings.Agent do
  use Agent

  alias Flightex.Bookings.Booking

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%Booking{} = booking) do
    booking = %{booking | id: UUID.uuid4()}

    Agent.update(__MODULE__, &update_state(&1, booking))

    {:ok, booking.id}
  end

  defp update_state(state, %Booking{} = booking), do: Map.put(state, booking.id, booking)

  def get(id), do: Agent.get(__MODULE__, &get_booking(&1, id))

  defp get_booking(state, id) do
    case Map.get(state, id) do
      nil -> {:error, "Flight Booking not found"}
      booking -> {:ok, booking}
    end
  end

  def search_in_range(%NaiveDateTime{} = from_date, %NaiveDateTime{} = to_date) do
    Agent.get(__MODULE__, &filter_in_range(&1, from_date, to_date))
  end

  defp filter_in_range(state, from_date, to_date) do
    Enum.filter(state, fn {_k, v} -> in_range?(v, from_date, to_date) end)
  end

  defp in_range?(%Booking{} = booking, from_date, to_date) do
    compare_from =
      case NaiveDateTime.compare(booking.data_completa, from_date) do
        r when r in [:eq, :gt] -> true
        _ -> false
      end

    compare_to =
      case NaiveDateTime.compare(booking.data_completa, to_date) do
        r when r in [:eq, :lt] -> true
        _ -> false
      end

    compare_from && compare_to
  end
end
