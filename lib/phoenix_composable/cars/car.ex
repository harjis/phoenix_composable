defmodule PhoenixComposable.Cars.Car do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cars" do
    field :color, :string
    field :vin_number, :string

    timestamps()
  end

  @doc false
  def changeset(car, attrs) do
    car
    |> cast(attrs, [:color, :vin_number])
    |> validate_required([:color, :vin_number])
  end
end
