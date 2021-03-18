defmodule FlightexTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.Booking
  alias Flightex.Users.Agent, as: UserAgent

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

    {:ok, user_id: user_id, booking_id: booking_id}
  end

  test "creates user" do
    response = Flightex.create_user(%{name: "Raul", email: "raul@mail.com", cpf: "65977019092"})

    assert {:ok, _user_id} = response
  end

  test "creates the booking", %{user_id: user_id} do
    response =
      Flightex.create_booking(user_id, %{
        data_completa: "2021-03-17T11:00:00.000Z",
        cidade_origem: "Rio de Janeiro",
        cidade_destino: "São Paulo"
      })

    assert {:ok, _booking_id} = response
  end

  test "gets the booking", %{booking_id: booking_id} do
    response = Flightex.get_booking(booking_id)

    assert {:ok,
            %Booking{
              cidade_destino: "São Paulo",
              cidade_origem: "Rio de Janeiro",
              data_completa: ~N[2021-03-17 11:00:00.000],
              id: _id,
              id_usuario: _id_usuario
            }} = response
  end

  test "generates report in range" do
    response =
      Flightex.generate_report(
        "2021-03-17T11:00:00.000Z",
        "2021-03-17T11:00:00.000Z",
        "report_test.csv"
      )

    expected_response = {:ok, "Report generated successfully"}

    assert response == expected_response
  end
end
