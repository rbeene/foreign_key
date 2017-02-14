defmodule ForeignKey.Repo.Migrations.CreateParent do
  use Ecto.Migration

  def change do
    create table(:parents) do

      timestamps()
    end

  end
end
