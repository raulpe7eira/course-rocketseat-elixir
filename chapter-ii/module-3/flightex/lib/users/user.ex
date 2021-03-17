defmodule Flightex.Users.User do
  @enforce_keys [:name, :email, :cpf]
  defstruct [:id, :name, :email, :cpf]

  def build(name, email, cpf) when is_bitstring(cpf) do
    {:ok,
     %__MODULE__{
       name: name,
       email: email,
       cpf: cpf
     }}
  end

  def build(_name, _email, _cpf), do: {:error, "Invalid parameters"}
end
