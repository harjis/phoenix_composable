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
    get "/cars/with_color", CarController, :list_cars_with_color
    resources "/cars", CarController
  end
end
