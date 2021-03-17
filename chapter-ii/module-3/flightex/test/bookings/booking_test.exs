defmodule Flightex.Bookings.BookingTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Bookings.Booking

  describe "build/5" do
    setup do
      {:ok, id: UUID.uuid4(), id_usuario: UUID.uuid4()}
    end

    test "when all params are valid, returns the booking", %{id: id, id_usuario: id_usuario} do
      response =
        Booking.build(id, "2021-03-17T11:00:00.000Z", "Rio de Janeiro", "São Paulo", id_usuario)

      expected_response = {:ok, build(:booking, id: id, id_usuario: id_usuario)}

      assert response == expected_response
    end

    test "when there are invalid id, returns an error", %{id_usuario: id_usuario} do
      response =
        Booking.build("", "2021-03-17T11:00:00.000Z", "Rio de Janeiro", "São Paulo", id_usuario)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "when there are invalid id_usuario, returns an error", %{id: id} do
      response = Booking.build(id, "2021-03-17T11:00:00.000Z", "Rio de Janeiro", "São Paulo", "")

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
