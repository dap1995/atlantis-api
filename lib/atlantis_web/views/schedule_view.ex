defmodule AtlantisWeb.ScheduleView do
  use AtlantisWeb, :view
  alias AtlantisWeb.ScheduleView

  def render("index.json", %{schedules: schedules}) do
    %{data: render_many(schedules, ScheduleView, "schedule.json")}
  end

  def render("show.json", %{schedule: schedule}) do
    %{data: render_one(schedule, ScheduleView, "raw_schedule.json")}
  end

  def render("raw_schedule.json", %{schedule: schedule}) do
    %{
      id: schedule.id,
      email: schedule.email,
      start_date: schedule.start_date,
      observation: schedule.observation,
      owner_id: schedule.owner_id,
      marine_id: schedule.marine_id,
      boat_id: schedule.boat_id,
      sailor_id: schedule.sailor_id,
    }
  end

  def render("schedule.json", %{schedule: schedule}) do
    %{
      id: schedule.id,
      email: schedule.email,
      start_date: schedule.start_date,
      observation: schedule.observation,
      owner_id: schedule.owner_id,
      marine: %{
        id: (schedule.marine && schedule.marine.id) || 0,
        name: (schedule.marine && schedule.marine.name) || ""
      },
      boat: %{
        id: (schedule.boat && schedule.boat.id) || 0,
        name: (schedule.boat && schedule.boat.name) || ""
      },
      sailor: %{
        id: (schedule.sailor && schedule.sailor.id) || 0,
        name: (schedule.sailor && schedule.sailor.name) || ""
      },
    }
  end
end
