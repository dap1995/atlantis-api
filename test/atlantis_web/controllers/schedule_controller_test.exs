defmodule AtlantisWeb.ScheduleControllerTest do
  use AtlantisWeb.ConnCase

  alias Atlantis.Business
  alias Atlantis.Business.Schedule

  @create_attrs %{
    boat_id: 42,
    email: "some email",
    marine_id: 42,
    observation: "some observation",
    sailor_id: 42,
    schedule_date: "2010-04-17T14:00:00Z"
  }
  @update_attrs %{
    boat_id: 43,
    email: "some updated email",
    marine_id: 43,
    observation: "some updated observation",
    sailor_id: 43,
    schedule_date: "2011-05-18T15:01:01Z"
  }
  @invalid_attrs %{boat_id: nil, email: nil, marine_id: nil, observation: nil, sailor_id: nil, schedule_date: nil}

  def fixture(:schedule) do
    {:ok, schedule} = Business.create_schedule(@create_attrs)
    schedule
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all schedules", %{conn: conn} do
      conn = get(conn, Routes.schedule_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create schedule" do
    test "renders schedule when data is valid", %{conn: conn} do
      conn = post(conn, Routes.schedule_path(conn, :create), schedule: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.schedule_path(conn, :show, id))

      assert %{
               "id" => id,
               "boat_id" => 42,
               "email" => "some email",
               "marine_id" => 42,
               "observation" => "some observation",
               "sailor_id" => 42,
               "schedule_date" => "2010-04-17T14:00:00Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.schedule_path(conn, :create), schedule: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update schedule" do
    setup [:create_schedule]

    test "renders schedule when data is valid", %{conn: conn, schedule: %Schedule{id: id} = schedule} do
      conn = put(conn, Routes.schedule_path(conn, :update, schedule), schedule: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.schedule_path(conn, :show, id))

      assert %{
               "id" => id,
               "boat_id" => 43,
               "email" => "some updated email",
               "marine_id" => 43,
               "observation" => "some updated observation",
               "sailor_id" => 43,
               "schedule_date" => "2011-05-18T15:01:01Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, schedule: schedule} do
      conn = put(conn, Routes.schedule_path(conn, :update, schedule), schedule: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete schedule" do
    setup [:create_schedule]

    test "deletes chosen schedule", %{conn: conn, schedule: schedule} do
      conn = delete(conn, Routes.schedule_path(conn, :delete, schedule))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.schedule_path(conn, :show, schedule))
      end
    end
  end

  defp create_schedule(_) do
    schedule = fixture(:schedule)
    {:ok, schedule: schedule}
  end
end
