defmodule PhoenixComposable.Repo.Migrations.CreateSpecifications do
  use Ecto.Migration

  def change do
    create table(:specifications) do
      add :engine_id, references(:engines, on_delete: :nothing), null: false
      add :transmission_id, references(:transmissions, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:specifications, [:engine_id])
    create index(:specifications, [:transmission_id])
  end
end
