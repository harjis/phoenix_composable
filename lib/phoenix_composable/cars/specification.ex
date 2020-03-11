defmodule PhoenixComposable.Cars.Specification do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhoenixComposable.Cars.{Transmission, Engine}

  @type t :: %__MODULE__{
               id: integer(),
               inserted_at: NaiveDateTime.t(),
               engine: Ecto.Schema.belongs_to(Engine),
               engine_id: integer(),
               transmission: Ecto.Schema.belongs_to(Transmission),
               transmission_id: integer(),
               updated_at: NaiveDateTime.t()
             }

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
