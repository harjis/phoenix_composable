# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhoenixComposable.Repo.insert!(%PhoenixComposable.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule PhoenixComposable.Fixtures.Cars do
  alias PhoenixComposable.Cars

  def complete_car_fixture(car_attrs \\ %{}, engine_attrs \\ %{}, transmission_attrs \\ %{}) do
    engine = engine_fixture(engine_attrs)
    transmission = transmission_fixture(transmission_attrs)
    specification = specification_fixture(%{transmission_id: transmission.id, engine_id: engine.id})
    car = car_fixture(Map.merge(car_attrs, %{specification_id: specification.id}))

    car
  end

  @valid_car_attrs %{color: "blue", vin_number: "some vin_number"}
  def car_fixture(attrs \\ %{}) do
    {:ok, car} =
      attrs
      |> Enum.into(@valid_car_attrs)
      |> Cars.create_car()

    car
  end

  @valid_transmission_attrs %{type: "automatic"}
  def transmission_fixture(attrs \\ %{}) do
    {:ok, transmission} = @valid_transmission_attrs
                          |> Map.merge(attrs)
                          |> Cars.create_transmission()

    transmission
  end

  @valid_engine_attrs %{cylinders: 4, horse_power: 100, name: "Mah engine"}
  def engine_fixture(attrs \\ %{}) do
    {:ok, engine} = @valid_engine_attrs
                    |> Map.merge(attrs)
                    |> Cars.create_engine()
    engine
  end


  def specification_fixture(%{transmission_id: _transmission_id, engine_id: _engine_id} = attrs) do
    {:ok, specification} = attrs
                           |> Cars.create_specification()
    specification
  end
end

PhoenixComposable.Fixtures.Cars.complete_car_fixture()
PhoenixComposable.Fixtures.Cars.complete_car_fixture(%{color: "red"}, %{horse_power: 150})
PhoenixComposable.Fixtures.Cars.complete_car_fixture(%{}, %{horse_power: 200}, %{type: "manual"})
