defmodule Flightex.Factory do
  use ExMachina

  alias Flightex.Users.User

  def user_factory do
    %User{
      id: "1234",
      name: "Raul",
      email: "raul@mail.com",
      cpf: "65977019092"
    }
  end
end
