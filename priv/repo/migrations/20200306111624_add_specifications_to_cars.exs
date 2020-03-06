defmodule PhoenixComposable.Repo.Migrations.AddSpecificationsToCars do
  use Ecto.Migration

  def change do
    alter table(:cars) do
      add :specification_id, references(:specifications, on_delete: :nothing)
    end
  end
end
