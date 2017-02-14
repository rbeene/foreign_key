defmodule ForeignKey.ChildView do
  use ForeignKey.Web, :view

  def render("index.json", %{child: child}) do
    %{data: render_many(child, ForeignKey.ChildView, "child.json")}
  end

  def render("show.json", %{child: child}) do
    %{data: render_one(child, ForeignKey.ChildView, "child.json")}
  end

  def render("child.json", %{child: child}) do
    %{id: child.id}
  end
end
