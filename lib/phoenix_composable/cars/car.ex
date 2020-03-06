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
    |> join(:inner, [c], s in assoc(c, :specification))
    |> join(:inner, [c, s], t in assoc(s, :transmission))
    |> where([c, s, t], t.type == ^type)
  end
end
