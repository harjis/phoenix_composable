defmodule PhoenixComposableWeb.Router do
  use PhoenixComposableWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixComposableWeb do
    pipe_through :api
    resources "/cars", CarController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixComposableWeb do
  #   pipe_through :api
  # end
end
