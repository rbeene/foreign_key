defmodule ForeignKey.ParentControllerTest do
  use ForeignKey.ConnCase

  alias ForeignKey.Parent
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, parent_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    parent = Repo.insert! %Parent{}
    conn = get conn, parent_path(conn, :show, parent)
    assert json_response(conn, 200)["data"] == %{"id" => parent.id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, parent_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, parent_path(conn, :create), parent: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Parent, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, parent_path(conn, :create), parent: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    parent = Repo.insert! %Parent{}
    conn = put conn, parent_path(conn, :update, parent), parent: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Parent, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    parent = Repo.insert! %Parent{}
    conn = put conn, parent_path(conn, :update, parent), parent: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    parent = Repo.insert! %Parent{}
    conn = delete conn, parent_path(conn, :delete, parent)
    assert response(conn, 204)
    refute Repo.get(Parent, parent.id)
  end
end
