defmodule PhoenixComposable.Cars do
  @moduledoc """
  The Cars context.
  """

  import Ecto.Query, warn: false
  alias PhoenixComposable.Repo

  alias PhoenixComposable.Cars.{Car, Specification, Transmission, Engine}

  def list_cars_with_color(color) do
    Car.with_color(color)
    |> Repo.all
  end

  def list_cars_with_transmission(type) do
    Car.with_transmission(type)
    |> Repo.all
  end

  def list_cars_with_color_and_transmission(car_color, transmission_type) do
    Car
    |> Car.with_color(car_color)
    |> Car.with_transmission(transmission_type)
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

  def create_engine(attrs \\ %{}) do
    %Engine{}
    |> Engine.changeset(attrs)
    |> Repo.insert()
  end

  def create_transmission(attrs \\ %{}) do
    %Transmission{}
    |> Transmission.changeset(attrs)
    |> Repo.insert()
  end

  def create_specification(attrs \\ %{}) do
    %Specification{}
    |> Specification.changeset(attrs)
    |> Repo.insert()
  end
end
