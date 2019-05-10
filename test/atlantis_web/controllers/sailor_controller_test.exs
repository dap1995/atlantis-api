defmodule AtlantisWeb.SailorControllerTest do
  use AtlantisWeb.ConnCase

  alias Atlantis.Business
  alias Atlantis.Business.Sailor

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:sailor) do
    {:ok, sailor} = Business.create_sailor(@create_attrs)
    sailor
  end

  setup %{conn: conn} do
    conn = Atlantis.Helpers.sign_in(conn)
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sailors", %{conn: conn} do
      conn = get(conn, Routes.sailor_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create sailor" do
    test "renders sailor when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sailor_path(conn, :create), sailor: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.sailor_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sailor_path(conn, :create), sailor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update sailor" do
    setup [:create_sailor]

    test "renders sailor when data is valid", %{conn: conn, sailor: %Sailor{id: id} = sailor} do
      conn = put(conn, Routes.sailor_path(conn, :update, sailor), sailor: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.sailor_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, sailor: sailor} do
      conn = put(conn, Routes.sailor_path(conn, :update, sailor), sailor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete sailor" do
    setup [:create_sailor]

    test "deletes chosen sailor", %{conn: conn, sailor: sailor} do
      conn = delete(conn, Routes.sailor_path(conn, :delete, sailor))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.sailor_path(conn, :show, sailor))
      end
    end
  end

  defp create_sailor(_) do
    sailor = fixture(:sailor)
    {:ok, sailor: sailor}
  end
end
