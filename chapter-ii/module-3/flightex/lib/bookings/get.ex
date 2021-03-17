defmodule Flightex.Bookings.Get do
  alias Flightex.Bookings.Agent, as: BookingAgent

  def call(booking_id) do
    BookingAgent.get(booking_id)
  end
end
