defmodule AtlantisWeb.ScheduleController do
  use AtlantisWeb, :controller

  alias Atlantis.Business
  alias Atlantis.Business.User
  alias Atlantis.Business.Marine
  alias Atlantis.Business.Boat
  alias Atlantis.Business.Sailor
  alias Atlantis.Business.Schedule

  action_fallback AtlantisWeb.FallbackController

  def index(conn, _params) do
    owner = Guardian.Plug.current_resource(conn)
    schedules = Business.list_schedules(owner.id)
    render(conn, "index.json", schedules: schedules)
  end

  def create(conn, %{"schedule" => schedule_params}) do
    with %{id: id} = owner <- Guardian.Plug.current_resource(conn),
        %Marine{owner_id: id} = marine <- Business.get_marine(schedule_params["marine_id"]),
        %Boat{owner_id: id} = boat <- Business.get_boat(schedule_params["boat_id"])
        # %Sailor{owner_id: id} = sailor <- Business.get_sailor(schedule_params["sailor_id"])
    do
      schedule_params_with_owner = Map.put(schedule_params, "owner_id", owner.id)
      with {:ok, %Schedule{} = schedule} <- Business.create_schedule(schedule_params_with_owner) do
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.schedule_path(conn, :show, schedule))
        |> render("show.json", schedule: schedule)
      end
    end
  end

  def show(conn, %{"id" => id}) do
    schedule = Business.get_schedule_with_preload!(id)
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
