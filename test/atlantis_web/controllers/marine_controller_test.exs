defmodule AtlantisWeb.MarineControllerTest do
  use AtlantisWeb.ConnCase

  alias Atlantis.Business
  alias Atlantis.Business.Marine

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:marine) do
    {:ok, marine} = Business.create_marine(@create_attrs)
    marine
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all marines", %{conn: conn} do
      conn = get(conn, Routes.marine_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create marine" do
    test "renders marine when data is valid", %{conn: conn} do
      conn = post(conn, Routes.marine_path(conn, :create), marine: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.marine_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.marine_path(conn, :create), marine: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update marine" do
    setup [:create_marine]

    test "renders marine when data is valid", %{conn: conn, marine: %Marine{id: id} = marine} do
      conn = put(conn, Routes.marine_path(conn, :update, marine), marine: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.marine_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, marine: marine} do
      conn = put(conn, Routes.marine_path(conn, :update, marine), marine: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete marine" do
    setup [:create_marine]

    test "deletes chosen marine", %{conn: conn, marine: marine} do
      conn = delete(conn, Routes.marine_path(conn, :delete, marine))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.marine_path(conn, :show, marine))
      end
    end
  end

  defp create_marine(_) do
    marine = fixture(:marine)
    {:ok, marine: marine}
  end
end
