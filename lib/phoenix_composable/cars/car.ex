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
    |> join_specification()
    |> join(:inner, [c, specification: s], t in assoc(s, :transmission), as: :transmissions)
    |> where([c, transmissions: t], t.type == ^type)
  end

  def with_engine_horse_power(query \\ Car, horse_power) do
    query
    |> join_specification()
    |> join(:inner, [c, specification: s], e in assoc(s, :engine), as: :engines)
    |> where([c, engines: e], e.horse_power >= ^horse_power)
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
