defmodule PhoenixComposable.CarsTest do
  use PhoenixComposable.DataCase

  alias PhoenixComposable.Cars
  alias PhoenixComposable.Cars.Car
  alias PhoenixComposable.Cars.Specification
  alias PhoenixComposable.Cars.Transmission

  import PhoenixComposable.Fixtures.Cars

  describe "cars" do
    test "list_cars_with_spec_preload/0" do
      complete_car_fixture()
      complete_car_fixture()

      assert length(Cars.list_cars_with_spec_preload()) == 2
    end

    test "list_cars_with_color/1 returns all cars by color" do
      complete_car_fixture()
      complete_car_fixture()
      complete_car_fixture(%{color: "red"})
      assert length(Cars.list_cars_with_color("blue")) == 2
    end

    test "list_cars_with_transmission/1" do
      complete_car_fixture()
      complete_car_fixture()
      complete_car_fixture(%{}, %{}, %{type: "manual"})

      actual = Cars.list_cars_with_transmission("automatic")
      assert length(actual) == 2

      assert [
               %Car{specification: %Specification{transmission: %Transmission{}}},
               %Car{specification: %Specification{transmission: %Transmission{}}}
             ] = actual
    end

    test "list_cars_with_color_and_transmission/2" do
      complete_car_fixture()
      complete_car_fixture(%{color: "red"})
      complete_car_fixture(%{}, %{}, %{type: "manual"})

      assert length(Cars.list_cars_with_color_and_transmission("blue", "automatic")) == 1
    end

    test "list_cars_with_color_and_transmission_and_horse_power/3" do
      complete_car_fixture()
      complete_car_fixture(%{color: "red"}, %{horse_power: 150})
      complete_car_fixture(%{}, %{horse_power: 200}, %{type: "manual"})

      assert length(
               Cars.list_cars_with_color_and_transmission_and_horse_power("blue", "manual", 200)
             ) == 1
    end
  end
end
