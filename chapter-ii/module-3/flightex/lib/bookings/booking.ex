defmodule Flightex.Bookings.Booking do
  alias Flightex.Users.User

  @enforce_keys [:id_usuario, :data_completa, :cidade_origem, :cidade_destino]
  defstruct [:id, :id_usuario, :data_completa, :cidade_origem, :cidade_destino]

  def build(%User{id: id_usuario}, data_completa, cidade_origem, cidade_destino) do
    data_completa
    |> NaiveDateTime.from_iso8601()
    |> build_booking(id_usuario, cidade_origem, cidade_destino)
  end

  def build(_user, _data_completa, _cidade_origem, _cidade_destino) do
    {:error, "Invalid parameters"}
  end

  defp build_booking({:ok, data_completa}, id_usuario, cidade_origem, cidade_destino) do
    {:ok,
     %__MODULE__{
       id_usuario: id_usuario,
       data_completa: data_completa,
       cidade_origem: cidade_origem,
       cidade_destino: cidade_destino
     }}
  end

  defp build_booking({:error, _reason}, _id_usuario, _cidade_origem, _cidade_destino) do
    {:error, "Invalid date"}
  end
end
