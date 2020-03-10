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

    test "select_car_ids_grouped_by_transmission_type/0" do
      car = complete_car_fixture()
      car2 = complete_car_fixture(%{color: "red"}, %{}, %{type: "manual"})
      car3 = complete_car_fixture(%{color: "red"}, %{}, %{type: "manual"})
      expected = %{"manual" => [car2.id, car3.id], "automatic" => [car.id]}

      cars = Car
             |> Car.select_car_ids_grouped_by_transmission_type
             |> Repo.all
      map = Enum.reduce(cars, %{}, fn car, acc -> Map.put(acc, car.t_type, car.ids) end)

      assert expected == map
    end

    test "group_by_transmission_type/0" do
      complete_car_fixture()
      complete_car_fixture(%{color: "red"}, %{}, %{type: "manual"})
      complete_car_fixture(%{color: "red"}, %{}, %{type: "manual"})
      expected = %{"automatic" => 1, "manual" => 2}

      cars = Car
             |> Car.group_by_transmission_type
             |> Car.count_rows
             |> Repo.all
      map = Enum.reduce(cars, %{}, fn car, acc -> Map.put(acc, car.t_type, car.count) end)
      assert expected == map
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
