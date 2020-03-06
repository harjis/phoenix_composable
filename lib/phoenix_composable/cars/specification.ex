defmodule PhoenixComposable.Cars.Specification do
  use Ecto.Schema
  import Ecto.Changeset

  schema "specifications" do
    field :engine_id, :id
    field :transmission_id, :id

    timestamps()
  end

  @doc false
  def changeset(specification, attrs) do
    specification
    |> cast(attrs, [])
    |> validate_required([])
  end
end
