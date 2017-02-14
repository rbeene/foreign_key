defmodule ForeignKey.ChildCustomView do
  use ForeignKey.Web, :view

  def render("index.json", %{child_custom: child_custom}) do
    %{data: render_many(child_custom, ForeignKey.ChildCustomView, "child_custom.json")}
  end

  def render("show.json", %{child_custom: child_custom}) do
    %{data: render_one(child_custom, ForeignKey.ChildCustomView, "child_custom.json")}
  end

  def render("child_custom.json", %{child_custom: child_custom}) do
    %{id: child_custom.id}
  end
end
