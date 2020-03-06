defmodule PhoenixComposable.Cars.Specification do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhoenixComposable.Cars.{Transmission, Engine}

  schema "specifications" do
    belongs_to :engine, Engine
    belongs_to :transmission, Transmission

    timestamps()
  end

  @doc false
  def changeset(specification, attrs) do
    specification
    |> cast(attrs, [:engine_id, :transmission_id])
    |> validate_required([:engine_id, :transmission_id])
  end
end
