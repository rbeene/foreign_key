defmodule ForeignKey.ParentTest do
  use ForeignKey.ModelCase

  alias ForeignKey.Parent

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Parent.changeset(%Parent{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Parent.changeset(%Parent{}, @invalid_attrs)
    refute changeset.valid?
  end
end
