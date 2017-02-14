defmodule ForeignKey.Repo.Migrations.CreateChildCustom do
  use Ecto.Migration

  def change do
    create table(:child_customs, primary_key: false) do
      add :child_custom_id, :serial, primary_key: true
      add :parent_custom_id, references(:parent_customs, column: :parent_custom_id, on_delete: :nothing)
      timestamps()
    end

    create index(:child_customs, [:parent_custom_id])
  end
end
