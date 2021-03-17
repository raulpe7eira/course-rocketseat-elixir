defmodule Flightex.Bookings.Booking do
  alias Flightex.Users.User

  @enforce_keys [:id_usuario, :data_completa, :cidade_origem, :cidade_destino]
  defstruct [:id, :id_usuario, :data_completa, :cidade_origem, :cidade_destino]

  def build(%User{id: id_usuario}, data_completa, cidade_origem, cidade_destino) do
    {:ok,
     %__MODULE__{
       data_completa: data_completa,
       cidade_origem: cidade_origem,
       cidade_destino: cidade_destino,
       id_usuario: id_usuario
     }}
  end

  def build(_user, _data_completa, _cidade_origem, _cidade_destino) do
    {:error, "Invalid parameters"}
  end
end
