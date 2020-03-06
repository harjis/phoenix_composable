defmodule PhoenixComposableWeb.PageController do
  use PhoenixComposableWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
