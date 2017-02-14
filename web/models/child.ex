defmodule ForeignKey.Child do
  use ForeignKey.Web, :model

  schema "childs" do
    belongs_to :parent, ForeignKey.Parent
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
