defmodule PhoenixComposable.Cars.Transmission do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transmissions" do
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(transmission, attrs) do
    transmission
    |> cast(attrs, [:type])
    |> validate_required([:type])
  end
end
