defmodule Flightex.Factory do
  use ExMachina

  alias Flightex.Bookings.Booking
  alias Flightex.Users.User

  def booking_factory do
    %Booking{
      id: nil,
      id_usuario: "1234",
      data_completa: "2021-03-17T11:00:00.000Z",
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
