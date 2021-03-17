defmodule Flightex.Bookings.BookingTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Bookings.Booking

  describe "build/4" do
    setup do
      {:ok, user: build(:user, id: UUID.uuid4())}
    end

    test "when all params are valid, returns the booking", %{user: user} do
      response = Booking.build(user, "2021-03-17T11:00:00.000Z", "Rio de Janeiro", "São Paulo")

      expected_response = {:ok, build(:booking, id_usuario: user.id)}

      assert response == expected_response
    end

    test "when there are invalid id_usuario, returns an error" do
      response = Booking.build(nil, "2021-03-17T11:00:00.000Z", "Rio de Janeiro", "São Paulo")

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
