defmodule ForeignKey.Repo.Migrations.CreateParentCustom do
  use Ecto.Migration

  def change do
    create table(:parent_customs, primary_key: false) do
      add :parent_custom_id, :serial, primary_key: true
      timestamps()
    end

  end
end
