defmodule Atlantis.BusinessTest do
  use Atlantis.DataCase

  alias Atlantis.Business

  describe "marines" do
    alias Atlantis.Business.Marine

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def marine_fixture(attrs \\ %{}) do
      {:ok, marine} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Business.create_marine()

      marine
    end

    test "list_marines/0 returns all marines" do
      marine = marine_fixture()
      assert Business.list_marines() == [marine]
    end

    test "get_marine!/1 returns the marine with given id" do
      marine = marine_fixture()
      assert Business.get_marine!(marine.id) == marine
    end

    test "create_marine/1 with valid data creates a marine" do
      assert {:ok, %Marine{} = marine} = Business.create_marine(@valid_attrs)
      assert marine.name == "some name"
    end

    test "create_marine/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Business.create_marine(@invalid_attrs)
    end

    test "update_marine/2 with valid data updates the marine" do
      marine = marine_fixture()
      assert {:ok, %Marine{} = marine} = Business.update_marine(marine, @update_attrs)
      assert marine.name == "some updated name"
    end

    test "update_marine/2 with invalid data returns error changeset" do
      marine = marine_fixture()
      assert {:error, %Ecto.Changeset{}} = Business.update_marine(marine, @invalid_attrs)
      assert marine == Business.get_marine!(marine.id)
    end

    test "delete_marine/1 deletes the marine" do
      marine = marine_fixture()
      assert {:ok, %Marine{}} = Business.delete_marine(marine)
      assert_raise Ecto.NoResultsError, fn -> Business.get_marine!(marine.id) end
    end

    test "change_marine/1 returns a marine changeset" do
      marine = marine_fixture()
      assert %Ecto.Changeset{} = Business.change_marine(marine)
    end
  end

  describe "boats" do
    alias Atlantis.Business.Boat

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def boat_fixture(attrs \\ %{}) do
      {:ok, boat} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Business.create_boat()

      boat
    end

    test "list_boats/0 returns all boats" do
      boat = boat_fixture()
      assert Business.list_boats() == [boat]
    end

    test "get_boat!/1 returns the boat with given id" do
      boat = boat_fixture()
      assert Business.get_boat!(boat.id) == boat
    end

    test "create_boat/1 with valid data creates a boat" do
      assert {:ok, %Boat{} = boat} = Business.create_boat(@valid_attrs)
      assert boat.name == "some name"
    end

    test "create_boat/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Business.create_boat(@invalid_attrs)
    end

    test "update_boat/2 with valid data updates the boat" do
      boat = boat_fixture()
      assert {:ok, %Boat{} = boat} = Business.update_boat(boat, @update_attrs)
      assert boat.name == "some updated name"
    end

    test "update_boat/2 with invalid data returns error changeset" do
      boat = boat_fixture()
      assert {:error, %Ecto.Changeset{}} = Business.update_boat(boat, @invalid_attrs)
      assert boat == Business.get_boat!(boat.id)
    end

    test "delete_boat/1 deletes the boat" do
      boat = boat_fixture()
      assert {:ok, %Boat{}} = Business.delete_boat(boat)
      assert_raise Ecto.NoResultsError, fn -> Business.get_boat!(boat.id) end
    end

    test "change_boat/1 returns a boat changeset" do
      boat = boat_fixture()
      assert %Ecto.Changeset{} = Business.change_boat(boat)
    end
  end

  describe "sailors" do
    alias Atlantis.Business.Sailor

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def sailor_fixture(attrs \\ %{}) do
      {:ok, sailor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Business.create_sailor()

      sailor
    end

    test "list_sailors/0 returns all sailors" do
      sailor = sailor_fixture()
      assert Business.list_sailors() == [sailor]
    end

    test "get_sailor!/1 returns the sailor with given id" do
      sailor = sailor_fixture()
      assert Business.get_sailor!(sailor.id) == sailor
    end

    test "create_sailor/1 with valid data creates a sailor" do
      assert {:ok, %Sailor{} = sailor} = Business.create_sailor(@valid_attrs)
      assert sailor.name == "some name"
    end

    test "create_sailor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Business.create_sailor(@invalid_attrs)
    end

    test "update_sailor/2 with valid data updates the sailor" do
      sailor = sailor_fixture()
      assert {:ok, %Sailor{} = sailor} = Business.update_sailor(sailor, @update_attrs)
      assert sailor.name == "some updated name"
    end

    test "update_sailor/2 with invalid data returns error changeset" do
      sailor = sailor_fixture()
      assert {:error, %Ecto.Changeset{}} = Business.update_sailor(sailor, @invalid_attrs)
      assert sailor == Business.get_sailor!(sailor.id)
    end

    test "delete_sailor/1 deletes the sailor" do
      sailor = sailor_fixture()
      assert {:ok, %Sailor{}} = Business.delete_sailor(sailor)
      assert_raise Ecto.NoResultsError, fn -> Business.get_sailor!(sailor.id) end
    end

    test "change_sailor/1 returns a sailor changeset" do
      sailor = sailor_fixture()
      assert %Ecto.Changeset{} = Business.change_sailor(sailor)
    end
  end

  describe "schedules" do
    alias Atlantis.Business.Schedule

    @valid_attrs %{boat_id: 42, email: "some email", marine_id: 42, observation: "some observation", sailor_id: 42, schedule_date: "2010-04-17T14:00:00Z"}
    @update_attrs %{boat_id: 43, email: "some updated email", marine_id: 43, observation: "some updated observation", sailor_id: 43, schedule_date: "2011-05-18T15:01:01Z"}
    @invalid_attrs %{boat_id: nil, email: nil, marine_id: nil, observation: nil, sailor_id: nil, schedule_date: nil}

    def schedule_fixture(attrs \\ %{}) do
      {:ok, schedule} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Business.create_schedule()

      schedule
    end

    test "list_schedules/0 returns all schedules" do
      schedule = schedule_fixture()
      assert Business.list_schedules() == [schedule]
    end

    test "get_schedule!/1 returns the schedule with given id" do
      schedule = schedule_fixture()
      assert Business.get_schedule!(schedule.id) == schedule
    end

    test "create_schedule/1 with valid data creates a schedule" do
      assert {:ok, %Schedule{} = schedule} = Business.create_schedule(@valid_attrs)
      assert schedule.boat_id == 42
      assert schedule.email == "some email"
      assert schedule.marine_id == 42
      assert schedule.observation == "some observation"
      assert schedule.sailor_id == 42
      assert schedule.schedule_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
    end

    test "create_schedule/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Business.create_schedule(@invalid_attrs)
    end

    test "update_schedule/2 with valid data updates the schedule" do
      schedule = schedule_fixture()
      assert {:ok, %Schedule{} = schedule} = Business.update_schedule(schedule, @update_attrs)
      assert schedule.boat_id == 43
      assert schedule.email == "some updated email"
      assert schedule.marine_id == 43
      assert schedule.observation == "some updated observation"
      assert schedule.sailor_id == 43
      assert schedule.schedule_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
    end

    test "update_schedule/2 with invalid data returns error changeset" do
      schedule = schedule_fixture()
      assert {:error, %Ecto.Changeset{}} = Business.update_schedule(schedule, @invalid_attrs)
      assert schedule == Business.get_schedule!(schedule.id)
    end

    test "delete_schedule/1 deletes the schedule" do
      schedule = schedule_fixture()
      assert {:ok, %Schedule{}} = Business.delete_schedule(schedule)
      assert_raise Ecto.NoResultsError, fn -> Business.get_schedule!(schedule.id) end
    end

    test "change_schedule/1 returns a schedule changeset" do
      schedule = schedule_fixture()
      assert %Ecto.Changeset{} = Business.change_schedule(schedule)
    end
  end

  describe "schedules" do
    alias Atlantis.Business.Schedule

    @valid_attrs %{email: "some email", observation: "some observation", schedule_date: "2010-04-17T14:00:00Z"}
    @update_attrs %{email: "some updated email", observation: "some updated observation", schedule_date: "2011-05-18T15:01:01Z"}
    @invalid_attrs %{email: nil, observation: nil, schedule_date: nil}

    def schedule_fixture(attrs \\ %{}) do
      {:ok, schedule} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Business.create_schedule()

      schedule
    end

    test "list_schedules/0 returns all schedules" do
      schedule = schedule_fixture()
      assert Business.list_schedules() == [schedule]
    end

    test "get_schedule!/1 returns the schedule with given id" do
      schedule = schedule_fixture()
      assert Business.get_schedule!(schedule.id) == schedule
    end

    test "create_schedule/1 with valid data creates a schedule" do
      assert {:ok, %Schedule{} = schedule} = Business.create_schedule(@valid_attrs)
      assert schedule.email == "some email"
      assert schedule.observation == "some observation"
      assert schedule.schedule_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
    end

    test "create_schedule/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Business.create_schedule(@invalid_attrs)
    end

    test "update_schedule/2 with valid data updates the schedule" do
      schedule = schedule_fixture()
      assert {:ok, %Schedule{} = schedule} = Business.update_schedule(schedule, @update_attrs)
      assert schedule.email == "some updated email"
      assert schedule.observation == "some updated observation"
      assert schedule.schedule_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
    end

    test "update_schedule/2 with invalid data returns error changeset" do
      schedule = schedule_fixture()
      assert {:error, %Ecto.Changeset{}} = Business.update_schedule(schedule, @invalid_attrs)
      assert schedule == Business.get_schedule!(schedule.id)
    end

    test "delete_schedule/1 deletes the schedule" do
      schedule = schedule_fixture()
      assert {:ok, %Schedule{}} = Business.delete_schedule(schedule)
      assert_raise Ecto.NoResultsError, fn -> Business.get_schedule!(schedule.id) end
    end

    test "change_schedule/1 returns a schedule changeset" do
      schedule = schedule_fixture()
      assert %Ecto.Changeset{} = Business.change_schedule(schedule)
    end
  end
end
