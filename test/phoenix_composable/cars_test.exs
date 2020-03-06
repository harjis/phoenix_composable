defmodule PhoenixComposable.CarsTest do
  use PhoenixComposable.DataCase

  alias PhoenixComposable.Cars

  describe "cars" do
    alias PhoenixComposable.Cars.Car

    @valid_attrs %{color: "some color", vin_number: "some vin_number"}
    @update_attrs %{color: "some updated color", vin_number: "some updated vin_number"}
    @invalid_attrs %{color: nil, vin_number: nil}

    def car_fixture(attrs \\ %{}) do
      {:ok, car} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cars.create_car()

      car
    end

    test "list_cars/0 returns all cars" do
      car = car_fixture()
      assert Cars.list_cars() == [car]
    end

    test "get_car!/1 returns the car with given id" do
      car = car_fixture()
      assert Cars.get_car!(car.id) == car
    end

    test "create_car/1 with valid data creates a car" do
      assert {:ok, %Car{} = car} = Cars.create_car(@valid_attrs)
      assert car.color == "some color"
      assert car.vin_number == "some vin_number"
    end

    test "create_car/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cars.create_car(@invalid_attrs)
    end

    test "update_car/2 with valid data updates the car" do
      car = car_fixture()
      assert {:ok, %Car{} = car} = Cars.update_car(car, @update_attrs)
      assert car.color == "some updated color"
      assert car.vin_number == "some updated vin_number"
    end

    test "update_car/2 with invalid data returns error changeset" do
      car = car_fixture()
      assert {:error, %Ecto.Changeset{}} = Cars.update_car(car, @invalid_attrs)
      assert car == Cars.get_car!(car.id)
    end

    test "delete_car/1 deletes the car" do
      car = car_fixture()
      assert {:ok, %Car{}} = Cars.delete_car(car)
      assert_raise Ecto.NoResultsError, fn -> Cars.get_car!(car.id) end
    end

    test "change_car/1 returns a car changeset" do
      car = car_fixture()
      assert %Ecto.Changeset{} = Cars.change_car(car)
    end
  end

  describe "engines" do
    alias PhoenixComposable.Cars.Engine

    @valid_attrs %{cylinders: 42, horse_power: 42, name: "some name"}
    @update_attrs %{cylinders: 43, horse_power: 43, name: "some updated name"}
    @invalid_attrs %{cylinders: nil, horse_power: nil, name: nil}

    def engine_fixture(attrs \\ %{}) do
      {:ok, engine} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cars.create_engine()

      engine
    end

    test "list_engines/0 returns all engines" do
      engine = engine_fixture()
      assert Cars.list_engines() == [engine]
    end

    test "get_engine!/1 returns the engine with given id" do
      engine = engine_fixture()
      assert Cars.get_engine!(engine.id) == engine
    end

    test "create_engine/1 with valid data creates a engine" do
      assert {:ok, %Engine{} = engine} = Cars.create_engine(@valid_attrs)
      assert engine.cylinders == 42
      assert engine.horse_power == 42
      assert engine.name == "some name"
    end

    test "create_engine/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cars.create_engine(@invalid_attrs)
    end

    test "update_engine/2 with valid data updates the engine" do
      engine = engine_fixture()
      assert {:ok, %Engine{} = engine} = Cars.update_engine(engine, @update_attrs)
      assert engine.cylinders == 43
      assert engine.horse_power == 43
      assert engine.name == "some updated name"
    end

    test "update_engine/2 with invalid data returns error changeset" do
      engine = engine_fixture()
      assert {:error, %Ecto.Changeset{}} = Cars.update_engine(engine, @invalid_attrs)
      assert engine == Cars.get_engine!(engine.id)
    end

    test "delete_engine/1 deletes the engine" do
      engine = engine_fixture()
      assert {:ok, %Engine{}} = Cars.delete_engine(engine)
      assert_raise Ecto.NoResultsError, fn -> Cars.get_engine!(engine.id) end
    end

    test "change_engine/1 returns a engine changeset" do
      engine = engine_fixture()
      assert %Ecto.Changeset{} = Cars.change_engine(engine)
    end
  end

  describe "specifications" do
    alias PhoenixComposable.Cars.Specification

    @valid_attrs %{}
    @update_attrs %{}

    def specification_fixture(attrs \\ %{}) do
      {:ok, specification} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cars.create_specification()

      specification
    end

    test "list_specifications/0 returns all specifications" do
      specification = specification_fixture()
      assert Cars.list_specifications() == [specification]
    end

    test "get_specification!/1 returns the specification with given id" do
      specification = specification_fixture()
      assert Cars.get_specification!(specification.id) == specification
    end

    test "create_specification/1 with valid data creates a specification" do
      assert {:ok, %Specification{} = specification} = Cars.create_specification(@valid_attrs)
    end

    test "update_specification/2 with valid data updates the specification" do
      specification = specification_fixture()
      assert {:ok, %Specification{} = specification} = Cars.update_specification(specification, @update_attrs)
    end

    test "delete_specification/1 deletes the specification" do
      specification = specification_fixture()
      assert {:ok, %Specification{}} = Cars.delete_specification(specification)
      assert_raise Ecto.NoResultsError, fn -> Cars.get_specification!(specification.id) end
    end

    test "change_specification/1 returns a specification changeset" do
      specification = specification_fixture()
      assert %Ecto.Changeset{} = Cars.change_specification(specification)
    end
  end

  describe "transmissions" do
    alias PhoenixComposable.Cars.Transmissions

    @valid_attrs %{type: "some type"}
    @update_attrs %{type: "some updated type"}
    @invalid_attrs %{type: nil}

    def transmissions_fixture(attrs \\ %{}) do
      {:ok, transmissions} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cars.create_transmissions()

      transmissions
    end

    test "list_transmissions/0 returns all transmissions" do
      transmissions = transmissions_fixture()
      assert Cars.list_transmissions() == [transmissions]
    end

    test "get_transmissions!/1 returns the transmissions with given id" do
      transmissions = transmissions_fixture()
      assert Cars.get_transmissions!(transmissions.id) == transmissions
    end

    test "create_transmissions/1 with valid data creates a transmissions" do
      assert {:ok, %Transmissions{} = transmissions} = Cars.create_transmissions(@valid_attrs)
      assert transmissions.type == "some type"
    end

    test "create_transmissions/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cars.create_transmissions(@invalid_attrs)
    end

    test "update_transmissions/2 with valid data updates the transmissions" do
      transmissions = transmissions_fixture()
      assert {:ok, %Transmissions{} = transmissions} = Cars.update_transmissions(transmissions, @update_attrs)
      assert transmissions.type == "some updated type"
    end

    test "update_transmissions/2 with invalid data returns error changeset" do
      transmissions = transmissions_fixture()
      assert {:error, %Ecto.Changeset{}} = Cars.update_transmissions(transmissions, @invalid_attrs)
      assert transmissions == Cars.get_transmissions!(transmissions.id)
    end

    test "delete_transmissions/1 deletes the transmissions" do
      transmissions = transmissions_fixture()
      assert {:ok, %Transmissions{}} = Cars.delete_transmissions(transmissions)
      assert_raise Ecto.NoResultsError, fn -> Cars.get_transmissions!(transmissions.id) end
    end

    test "change_transmissions/1 returns a transmissions changeset" do
      transmissions = transmissions_fixture()
      assert %Ecto.Changeset{} = Cars.change_transmissions(transmissions)
    end
  end
end
