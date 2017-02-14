defmodule ForeignKey.ParentCustom do
  use ForeignKey.Web, :model

  @primary_key {:parent_custom_id, :id, autogenerate: true}
  @derive {Phoenix.Param, key: :parent_custom_id}

  schema "parent_customs" do
    has_many :child_customs, ForeignKey.ChildCustom, foreign_key: :parent_custom_id
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
