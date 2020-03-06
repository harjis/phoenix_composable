defmodule PhoenixComposable.CarsTest do
  use PhoenixComposable.DataCase

  alias PhoenixComposable.Cars

  describe "cars" do
    @valid_attrs %{color: "blue", vin_number: "some vin_number"}

    def car_fixture(attrs \\ %{}) do
      {:ok, car} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cars.create_car()

      car
    end

    test "list_cars_by_color/1 returns all cars by color" do
      car_fixture()
      car_fixture()
      car_fixture(%{color: "red"})
      assert length(Cars.list_cars_by_color("blue")) == 2
    end
  end
end
