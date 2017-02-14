defmodule ForeignKey.Factory do
  use ExMachina.Ecto, repo: ForeignKey.Repo
  alias ForeignKey.Parent
  alias ForeignKey.ParentCustom
  alias ForeignKey.Child
  alias ForeignKey.ChildCustom

  def parent_factory do
    %Parent{}
  end

  def parent_custom_factory do
    %ParentCustom{}
  end

  def child_factory do
    %Child{
      parent: build(:parent)
    }
  end

  def child_custom_factory do
    %ChildCustom{
      parent_custom: build(:parent_custom)
    }
  end

end
