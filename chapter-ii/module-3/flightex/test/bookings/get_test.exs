defmodule Flightex.Bookings.GetTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.Get
  alias Flightex.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      Flightex.start_agents()

      {:ok, user_id} =
        :user
        |> build()
        |> UserAgent.save()

      {:ok, booking_id} =
        :booking
        |> build(id_usuario: user_id)
        |> BookingAgent.save()

      {:ok, booking_id: booking_id}
    end

    test "when all params are valid, gets the booking", %{booking_id: booking_id} do
      response = Get.call(booking_id)

      assert {:ok, _uuid} = response
    end

    test "when there is no booking with given booking_id, returns an error" do
      response = Get.call("non-booking-id")

      expected_response = {:error, "Flight Booking not found"}

      assert response == expected_response
    end
  end
end
