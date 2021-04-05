defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

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

  def user_factory do
    %User{
      age: 22,
      address: "Rua X, 123",
      cep: "12345678",
      cpf: "47971092032",
      email: "raul@mail.com",
      password: "123456",
      name: "Raul Pereira",
      id: "27d34263-6b3f-4236-a2a1-3949c3804b93"
    }
  end

  def cep_info_factory do
    %{
      "cep" => "01001-000",
      "logradouro" => "Praça da Sé",
      "complemento" => "lado ímpar",
      "bairro" => "Sé",
      "localidade" => "São Paulo",
      "uf" => "SP",
      "ibge" => "3550308",
      "gia" => "1004",
      "ddd" => "11",
      "siafi" => "7107"
    }
  end
end
