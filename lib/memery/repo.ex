defmodule Memery.Repo do
  use Ecto.Repo,
    otp_app: :memery,
    adapter: Ecto.Adapters.Postgres
end
