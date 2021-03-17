defmodule Flightex.Bookings.Create do
  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.Booking
  alias Flightex.Users.Agent, as: UserAgent

  def call(user_id, %{
        data_completa: data_completa,
        cidade_origem: cidade_origem,
        cidade_destino: cidade_destino
      }) do
    with {:ok, user} <- UserAgent.get(user_id),
         {:ok, booking} <- Booking.build(user, data_completa, cidade_origem, cidade_destino) do
      BookingAgent.save(booking)
    else
      error -> error
    end
  end
end
