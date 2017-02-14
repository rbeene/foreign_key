defmodule ForeignKey.ChildTest do
  use ForeignKey.ModelCase

  alias ForeignKey.Child
  import ForeignKey.Factory

  @valid_attrs %{}
  @invalid_attrs %{}

  test "foreign_key of model with standard primary key is retained" do
    parent = insert(:parent)
    child = insert(:child, parent: parent)

    assert child.parent == parent
    assert child.parent_id == parent.id
  end

end
