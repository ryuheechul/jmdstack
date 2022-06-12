defmodule Pax.Repo do
  use Ecto.Repo,
    otp_app: :pax,
    adapter: Ecto.Adapters.Postgres
end
