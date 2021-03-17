defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Raul",
      address: "Rua sem fim",
      email: "raul@mail.com",
      cpf: "65977019092",
      age: 40
    }
  end
end
