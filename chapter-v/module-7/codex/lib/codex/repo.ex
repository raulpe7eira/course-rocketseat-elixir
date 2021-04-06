defmodule Codex.Repo do
  use Ecto.Repo,
    otp_app: :codex,
    adapter: Ecto.Adapters.Postgres
end
