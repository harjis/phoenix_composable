defmodule PhoenixComposable.Cars.Transmissions do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transmissions" do
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(transmissions, attrs) do
    transmissions
    |> cast(attrs, [:type])
    |> validate_required([:type])
  end
end
