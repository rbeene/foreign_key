defmodule ForeignKey.Repo.Migrations.CreateChild do
  use Ecto.Migration

  def change do
    create table(:childs) do
      add :parent_id, references(:parents, on_delete: :nothing)
      timestamps()
    end

  end
end
