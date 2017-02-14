defmodule ForeignKey.PageController do
  use ForeignKey.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
