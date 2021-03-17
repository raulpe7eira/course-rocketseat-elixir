defmodule Flightex.Bookings.AgentTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Bookings.Agent, as: BookingAgent

  describe "save/1" do
    test "saves the booking" do
      BookingAgent.start_link(%{})

      booking = build(:booking)

      assert {:ok, _booking_id} = BookingAgent.save(booking)
    end
  end

  describe "get/1" do
    setup do
      BookingAgent.start_link(%{})

      booking = build(:booking)

      {:ok, id} = BookingAgent.save(booking)

      {:ok, booking: %{booking | id: id}}
    end

    test "when the booking is found, returns the booking", %{booking: booking} do
      response = BookingAgent.get(booking.id)

      expected_response = {:ok, booking}

      assert response == expected_response
    end

    test "when the booking is not found, returns an error" do
      response = BookingAgent.get("non-booking")

      expected_response = {:error, "Flight Booking not found"}

      assert response == expected_response
    end
  end

  describe "search_in_range/2" do
    test "when the range are valid, returns the bookings" do
      BookingAgent.start_link(%{})

      bookings = [
        build(:booking, data_completa: ~N[2021-03-16 11:00:00.000]),
        build(:booking, data_completa: ~N[2021-03-17 11:00:00.000]),
        build(:booking, data_completa: ~N[2021-03-18 11:00:00.000])
      ]

      Enum.map(bookings, fn booking -> BookingAgent.save(booking) end)

      assert Enum.count(
               BookingAgent.search_in_range(
                 ~N[2021-03-17 11:00:00.000],
                 ~N[2021-03-17 11:00:00.000]
               )
             ) == 1

      assert Enum.count(
               BookingAgent.search_in_range(
                 ~N[2021-03-16 11:00:00.000],
                 ~N[2021-03-17 11:00:00.000]
               )
             ) == 2

      assert Enum.count(
               BookingAgent.search_in_range(
                 ~N[2021-03-16 11:00:00.000],
                 ~N[2021-03-18 11:00:00.000]
               )
             ) == 3

      assert BookingAgent.search_in_range(
               ~N[2021-03-20 11:00:00.000],
               ~N[2021-03-20 11:00:00.000]
             ) == []
    end
  end
end
