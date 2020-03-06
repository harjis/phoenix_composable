defmodule PhoenixComposable.Repo.Migrations.CreateTransmissions do
  use Ecto.Migration

  def change do
    create table(:transmissions) do
      add :type, :string

      timestamps()
    end

  end
end
