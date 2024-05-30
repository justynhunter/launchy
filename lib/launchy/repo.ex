defmodule Launchy.Repo do
  use Ecto.Repo,
    otp_app: :launchy,
    adapter: Ecto.Adapters.Postgres
end
