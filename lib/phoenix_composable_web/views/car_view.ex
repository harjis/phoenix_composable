defmodule PhoenixComposableWeb.CarView do
  use PhoenixComposableWeb, :view
  alias PhoenixComposableWeb.CarView

  def render("index.json", %{cars: cars}) do
    %{data: render_many(cars, CarView, "car.json")}
  end

  def render("show.json", %{car: car}) do
    %{data: render_one(car, CarView, "car.json")}
  end

  def render("car.json", %{car: car}) do
    %{id: car.id,
      color: car.color,
      vin_number: car.vin_number}
  end
end
