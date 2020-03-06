defmodule PhoenixComposable.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_composable,
    adapter: Ecto.Adapters.Postgres
end
