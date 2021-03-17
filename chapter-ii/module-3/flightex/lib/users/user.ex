defmodule Flightex.Users.User do
  @keys [:id, :name, :email, :cpf]
  @enforce_keys @keys

  defstruct @keys

  def build(id, name, email, cpf) when byte_size(id) > 1 and is_bitstring(cpf) do
    {:ok,
     %__MODULE__{
       id: id,
       name: name,
       email: email,
       cpf: cpf
     }}
  end

  def build(_id, _name, _email, _cpf), do: {:error, "Invalid parameters"}
end
