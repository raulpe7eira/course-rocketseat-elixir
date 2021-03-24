defmodule Rockelivery.Factory do
  use ExMachina

  def user_params_factory do
    %{
      age: 22,
      address: "Rua X, 123",
      cep: "12345678",
      cpf: "47971092032",
      email: "raul@mail.com",
      password: "123456",
      name: "Raul Pereira"
    }
  end
end
