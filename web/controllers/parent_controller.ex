defmodule ForeignKey.ParentController do
  use ForeignKey.Web, :controller

  alias ForeignKey.Parent

  def index(conn, _params) do
    parent = Repo.all(Parent)
    render(conn, "index.json", parent: parent)
  end

  def create(conn, %{"parent" => parent_params}) do
    changeset = Parent.changeset(%Parent{}, parent_params)

    case Repo.insert(changeset) do
      {:ok, parent} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", parent_path(conn, :show, parent))
        |> render("show.json", parent: parent)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ForeignKey.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    parent = Repo.get!(Parent, id)
    render(conn, "show.json", parent: parent)
  end

  def update(conn, %{"id" => id, "parent" => parent_params}) do
    parent = Repo.get!(Parent, id)
    changeset = Parent.changeset(parent, parent_params)

    case Repo.update(changeset) do
      {:ok, parent} ->
        render(conn, "show.json", parent: parent)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ForeignKey.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    parent = Repo.get!(Parent, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(parent)

    send_resp(conn, :no_content, "")
  end
end
