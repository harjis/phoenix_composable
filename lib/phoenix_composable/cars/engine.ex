defmodule PhoenixComposable.Cars.Engine do
  use Ecto.Schema
  import Ecto.Changeset

  schema "engines" do
    field :cylinders, :integer
    field :horse_power, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(engine, attrs) do
    engine
    |> cast(attrs, [:name, :cylinders, :horse_power])
    |> validate_required([:name, :cylinders, :horse_power])
  end
end
