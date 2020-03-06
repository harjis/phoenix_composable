defmodule PhoenixComposable.Cars do
  @moduledoc """
  The Cars context.
  """

  import Ecto.Query, warn: false
  alias PhoenixComposable.Repo

  alias PhoenixComposable.Cars.Car

  def list_cars_by_color(color) do
    Car.with_color(color)
    |> Repo.all
  end

  def list_cars do
    Repo.all(Car)
  end

  def get_car!(id), do: Repo.get!(Car, id)

  def create_car(attrs \\ %{}) do
    %Car{}
    |> Car.changeset(attrs)
    |> Repo.insert()
  end

  def update_car(%Car{} = car, attrs) do
    car
    |> Car.changeset(attrs)
    |> Repo.update()
  end

  def delete_car(%Car{} = car) do
    Repo.delete(car)
  end

end
