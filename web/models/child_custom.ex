defmodule ForeignKey.ChildCustom do
  use ForeignKey.Web, :model

  @primary_key {:child_custom_id, :id, autogenerate: true}
  @derive {Phoenix.Param, key: :child_custom_id}

  schema "child_customs" do
    belongs_to :parent_custom, ForeignKey.ParentCustom
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
