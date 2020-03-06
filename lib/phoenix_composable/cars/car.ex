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
    |> cast(attrs, [:color, :vin_number])
    |> validate_required([:color, :vin_number])
  end

  def with_color(color) do
    Car
    |> where([c], c.color == ^color)
  end
end
