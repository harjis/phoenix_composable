defmodule PhoenixComposable.CarTest do
  use PhoenixComposable.DataCase

  alias PhoenixComposable.Repo
  alias PhoenixComposable.Cars.Car

  import PhoenixComposable.Fixtures.Cars

  describe "with_color/1" do
    test "returns cars with certain color" do
      complete_car_fixture()
      complete_car_fixture(%{color: "red"})
      complete_car_fixture(%{color: "red"})

      cars = Car |> Car.with_color("blue") |> Repo.all
      assert length(cars) == 1
    end
  end
end
