defmodule DailyMeals.Repo do
  use Ecto.Repo,
    otp_app: :daily_meals,
    adapter: Ecto.Adapters.Postgres
end
