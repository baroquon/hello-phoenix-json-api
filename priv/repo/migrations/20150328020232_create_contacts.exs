defmodule HelloPhoenix.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :name
      add :phone

      timestamps
    end
  end
end
