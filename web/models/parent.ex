defmodule ForeignKey.Parent do
  use ForeignKey.Web, :model

  schema "parents" do
    has_many :childs, ForeignKey.Child, foreign_key: :parent_id
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
