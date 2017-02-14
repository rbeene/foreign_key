defmodule ForeignKey.ChildCustomTest do
  use ForeignKey.ModelCase

  alias ForeignKey.ChildCustom
  import ForeignKey.Factory

  @valid_attrs %{}
  @invalid_attrs %{}

  test "foreign_key of model with custom primary key is retained" do
    parent_custom = insert(:parent_custom)
    child_custom = insert(:child_custom, parent_custom: parent_custom)

    assert child_custom.parent_custom_id == parent_custom.parent_custom_id
  end
end
