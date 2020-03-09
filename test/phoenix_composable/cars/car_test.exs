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

      cars = Car
             |> Car.with_color("blue")
             |> Repo.all
      assert length(cars) == 1
    end

    test "returns paginated cars" do
      complete_car_fixture()
      complete_car_fixture(%{color: "red"})
      complete_car_fixture(%{color: "red"})

      {cars, count} = Car
                      |> Car.with_color("red")
                      |> Repo.paginate
      assert length(cars) == 2
      assert count === 2
    end
  end
end
