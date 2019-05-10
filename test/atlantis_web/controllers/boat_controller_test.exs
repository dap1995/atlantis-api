defmodule AtlantisWeb.BoatControllerTest do
  use AtlantisWeb.ConnCase
  alias Atlantis.Business
  alias Atlantis.Business.Boat

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:boat) do
    {:ok, boat} = Business.create_boat(@create_attrs)
    boat
  end

  setup %{conn: conn} do
    conn = Atlantis.Helpers.sign_in(conn)
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  @tag :logged_in
  describe "index" do
    test "lists all boats", %{conn: conn} do
      conn = get(conn, Routes.boat_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create boat" do
    test "renders boat when data is valid", %{conn: conn} do
      conn = post(conn, Routes.boat_path(conn, :create), boat: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.boat_path(conn, :show, id))

      assert %{
        "id" => id,
        "name" => "some name"
      } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.boat_path(conn, :create), boat: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update boat" do
    setup [:create_boat]

    test "renders boat when data is valid", %{conn: conn, boat: %Boat{id: id} = boat} do
      conn = put(conn, Routes.boat_path(conn, :update, boat), boat: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.boat_path(conn, :show, id))

      assert %{
        "id" => id,
        "name" => "some updated name"
      } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, boat: boat} do
      conn = put(conn, Routes.boat_path(conn, :update, boat), boat: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete boat" do
    setup [:create_boat]

    test "deletes chosen boat", %{conn: conn, boat: boat} do
      conn = delete(conn, Routes.boat_path(conn, :delete, boat))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.boat_path(conn, :show, boat))
      end
    end
  end

  defp create_boat(_) do
    boat = fixture(:boat)
    {:ok, boat: boat}
  end
end
