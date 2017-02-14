defmodule ForeignKey.ParentCustomView do
  use ForeignKey.Web, :view

  def render("index.json", %{parent_custom: parent_custom}) do
    %{data: render_many(parent_custom, ForeignKey.ParentCustomView, "parent_custom.json")}
  end

  def render("show.json", %{parent_custom: parent_custom}) do
    %{data: render_one(parent_custom, ForeignKey.ParentCustomView, "parent_custom.json")}
  end

  def render("parent_custom.json", %{parent_custom: parent_custom}) do
    %{id: parent_custom.id}
  end
end
