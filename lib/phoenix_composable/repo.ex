defmodule PhoenixComposable.Repo do
  use Ecto.Repo, otp_app: :phoenix_composable, adapter: Ecto.Adapters.Postgres
  import Ecto.Query

  def paginate(query, page_number \\ 1) do
    {entries(query, page_number), total_count(query)}
  end

  defp entries(query, page_number) do
    page_size = 10
    offset = page_size * (page_number - 1)

    query
    |> limit([_], ^page_size)
    |> offset([_], ^offset)
    |> all
  end

  defp total_count(query) do
    query
    |> exclude(:order_by)
    |> exclude(:preload)
    |> exclude(:select)
    |> select([_], count("*"))
    |> one
  end
end
