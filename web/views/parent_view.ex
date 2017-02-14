defmodule ForeignKey.ParentView do
  use ForeignKey.Web, :view

  def render("index.json", %{parent: parent}) do
    %{data: render_many(parent, ForeignKey.ParentView, "parent.json")}
  end

  def render("show.json", %{parent: parent}) do
    %{data: render_one(parent, ForeignKey.ParentView, "parent.json")}
  end

  def render("parent.json", %{parent: parent}) do
    %{id: parent.id}
  end
end
