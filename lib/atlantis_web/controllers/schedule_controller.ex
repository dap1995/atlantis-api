defmodule AtlantisWeb.ScheduleController do
  use AtlantisWeb, :controller

  alias Atlantis.Business
  alias Atlantis.Business.Schedule

  action_fallback AtlantisWeb.FallbackController

  def index(conn, _params) do
    schedules = Business.list_schedules()
    render(conn, "index.json", schedules: schedules)
  end

  def create(conn, %{"schedule" => schedule_params}) do
    with {:ok, %Schedule{} = schedule} <- Business.create_schedule(schedule_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.schedule_path(conn, :show, schedule))
      |> render("show.json", schedule: schedule)
    end
  end

  def show(conn, %{"id" => id}) do
    schedule = Business.get_schedule!(id)
    render(conn, "show.json", schedule: schedule)
  end

  def update(conn, %{"id" => id, "schedule" => schedule_params}) do
    schedule = Business.get_schedule!(id)

    with {:ok, %Schedule{} = schedule} <- Business.update_schedule(schedule, schedule_params) do
      render(conn, "show.json", schedule: schedule)
    end
  end

  def delete(conn, %{"id" => id}) do
    schedule = Business.get_schedule!(id)

    with {:ok, %Schedule{}} <- Business.delete_schedule(schedule) do
      send_resp(conn, :no_content, "")
    end
  end
end
