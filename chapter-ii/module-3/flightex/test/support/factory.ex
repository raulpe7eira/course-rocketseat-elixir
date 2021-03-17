defmodule Flightex.Factory do
  use ExMachina

  alias Flightex.Bookings.Booking
  alias Flightex.Users.User

  def booking_factory do
    %Booking{
      id: nil,
      id_usuario: "1234",
      data_completa: ~N[2021-03-17 11:00:00.000],
      cidade_origem: "Rio de Janeiro",
      cidade_destino: "São Paulo"
    }
  end

  def user_factory do
    %User{
      id: nil,
      name: "Raul",
      email: "raul@mail.com",
      cpf: "65977019092"
    }
  end
end
