defmodule PhoenixComposable.Cars.Car do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias PhoenixComposable.Cars.Car
  alias PhoenixComposable.Cars.Specification

  schema "cars" do
    field :color, :string
    field :vin_number, :string

    belongs_to :specification, Specification

    timestamps()
  end

  @doc false
  def changeset(car, attrs) do
    car
    |> cast(attrs, [:color, :vin_number, :specification_id])
    |> validate_required([:color, :vin_number, :specification_id])
  end

  def with_color(query \\ Car, color) do
    query
    |> where([c], c.color == ^color)
  end

  def with_transmission(query \\ Car, type) do
    query
    |> join_transmission
    |> where([c, transmission: t], t.type == ^type)
  end

  def with_engine_horse_power(query \\ Car, horse_power) do
    query
    |> join_specification()
    |> join(:inner, [c, specification: s], e in assoc(s, :engine), as: :engines)
    |> where([c, engines: e], e.horse_power >= ^horse_power)
  end

  def group_by_transmission_type(query \\ Car) do
    query
    |> join_transmission
    |> group_by([c, transmission: t], t.type)
    |> select([c, transmission: t], %{t_type: t.type})
  end

  def count_rows(query \\ Car) do
    query
    |> select_merge(%{count: count()})
  end

  def select_car_ids_grouped_by_transmission_type(query \\ Car) do
    query
    |> join_transmission
    |> group_by_transmission_type
    |> select([c, transmission: t], %{t_type: t.type, ids: fragment("array_agg(?) as car_ids", c.id)})
  end

  defp join_transmission(query \\ Car) do
    if has_named_binding?(query, :transmission) do
      query
    else
      query
      |> join_specification()
      |> join(:inner, [c, specification: s], t in assoc(s, :transmission), as: :transmission)
    end
  end

  defp join_specification(query) do
    if has_named_binding?(query, :specification) do
      query
    else
      query
      |> join(:inner, [c], s in assoc(c, :specification), as: :specification)
    end
  end
end
