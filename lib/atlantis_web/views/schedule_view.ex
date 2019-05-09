defmodule AtlantisWeb.ScheduleView do
  use AtlantisWeb, :view
  alias AtlantisWeb.ScheduleView

  def render("index.json", %{schedules: schedules}) do
    %{data: render_many(schedules, ScheduleView, "schedule.json")}
  end

  def render("show.json", %{schedule: schedule}) do
    %{data: render_one(schedule, ScheduleView, "schedule.json")}
  end

  def render("schedule.json", %{schedule: schedule}) do
    %{id: schedule.id,
      boat_id: schedule.boat_id,
      marine_id: schedule.marine_id,
      schedule_date: schedule.schedule_date,
      observation: schedule.observation,
      email: schedule.email,
      sailor_id: schedule.sailor_id}
  end
end
