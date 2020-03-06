defmodule PhoenixComposableWeb.CarControllerTest do
  use PhoenixComposableWeb.ConnCase

  alias PhoenixComposable.Cars.Car

  import PhoenixComposable.Fixtures.Cars

  @create_attrs %{
    color: "some color",
    vin_number: "some vin_number"
  }
  @update_attrs %{
    color: "some updated color",
    vin_number: "some updated vin_number"
  }
  @invalid_attrs %{color: nil, vin_number: nil}

  def fixture(:car) do
    car = complete_car_fixture()
    car
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all cars", %{conn: conn} do
      conn = get(conn, Routes.car_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create car" do
#    test "renders car when data is valid", %{conn: conn} do
#      conn = post(conn, Routes.car_path(conn, :create), car: @create_attrs)
#      assert %{"id" => id} = json_response(conn, 201)["data"]
#
#      conn = get(conn, Routes.car_path(conn, :show, id))
#
#      assert %{
#               "id" => id,
#               "color" => "some color",
#               "vin_number" => "some vin_number"
#             } = json_response(conn, 200)["data"]
#    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.car_path(conn, :create), car: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update car" do
    setup [:create_car]

    test "renders car when data is valid", %{conn: conn, car: %Car{id: id} = car} do
      conn = put(conn, Routes.car_path(conn, :update, car), car: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.car_path(conn, :show, id))

      assert %{
               "id" => id,
               "color" => "some updated color",
               "vin_number" => "some updated vin_number"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, car: car} do
      conn = put(conn, Routes.car_path(conn, :update, car), car: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete car" do
    setup [:create_car]

    test "deletes chosen car", %{conn: conn, car: car} do
      conn = delete(conn, Routes.car_path(conn, :delete, car))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.car_path(conn, :show, car))
      end
    end
  end

  defp create_car(_) do
    car = fixture(:car)
    {:ok, car: car}
  end
end
