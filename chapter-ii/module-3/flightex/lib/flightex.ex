defmodule Flightex do
  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.Create, as: BookingCreate
  alias Flightex.Bookings.Get, as: BookingGet
  alias Flightex.Bookings.Report, as: BookingReport
  alias Flightex.Users.Agent, as: UserAgent
  alias Flightex.Users.Create, as: UserCreate

  def start_agents do
    BookingAgent.start_link(%{})
    UserAgent.start_link(%{})
  end

  defdelegate create_booking(user_id, params), to: BookingCreate, as: :call

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate generate_report(from_date, to_date, filename \\ "report.csv"),
    to: BookingReport,
    as: :call

  defdelegate get_booking(booking_id), to: BookingGet, as: :call
end
