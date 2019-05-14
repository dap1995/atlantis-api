defmodule Atlantis.Business do
  @moduledoc """
  The Business context.
  """

  import Ecto.Query, warn: false
  alias Atlantis.Repo

  alias Atlantis.Business.Marine

  @doc """
  Returns the list of marines.

  ## Examples

      iex> list_marines()
      [%Marine{}, ...]

  """
  def list_marines do
    Repo.all(Marine)
  end

  def list_marines(owner_id) do
    Repo.all(from m in Marine, where: m.owner_id == ^owner_id)
  end

  @doc """
  Gets a single marine.

  Raises `Ecto.NoResultsError` if the Marine does not exist.

  ## Examples

      iex> get_marine!(123)
      %Marine{}

      iex> get_marine!(456)
      ** (Ecto.NoResultsError)

  """
  def get_marine!(id), do: Repo.get!(Marine, id)

  @doc """
  Creates a marine.

  ## Examples

      iex> create_marine(%{field: value})
      {:ok, %Marine{}}

      iex> create_marine(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_marine(attrs \\ %{}) do
    %Marine{}
    |> Marine.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a marine.

  ## Examples

      iex> update_marine(marine, %{field: new_value})
      {:ok, %Marine{}}

      iex> update_marine(marine, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_marine(%Marine{} = marine, attrs) do
    marine
    |> Marine.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Marine.

  ## Examples

      iex> delete_marine(marine)
      {:ok, %Marine{}}

      iex> delete_marine(marine)
      {:error, %Ecto.Changeset{}}

  """
  def delete_marine(%Marine{} = marine) do
    Repo.delete(marine)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking marine changes.

  ## Examples

      iex> change_marine(marine)
      %Ecto.Changeset{source: %Marine{}}

  """
  def change_marine(%Marine{} = marine) do
    Marine.changeset(marine, %{})
  end

  alias Atlantis.Business.Boat

  @doc """
  Returns the list of boats.

  ## Examples

      iex> list_boats()
      [%Boat{}, ...]

  """
  def list_boats do
    Repo.all(Boat)
  end

  def list_boats(owner_id) do
    Repo.all(from b in Boat, where: b.owner_id == ^owner_id)
  end

  @doc """
  Gets a single boat.

  Raises `Ecto.NoResultsError` if the Boat does not exist.

  ## Examples

      iex> get_boat!(123)
      %Boat{}

      iex> get_boat!(456)
      ** (Ecto.NoResultsError)

  """
  def get_boat!(id), do: Repo.get!(Boat, id)

  @doc """
  Creates a boat.

  ## Examples

      iex> create_boat(%{field: value})
      {:ok, %Boat{}}

      iex> create_boat(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_boat(attrs \\ %{}) do
    %Boat{}
    |> Boat.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a boat.

  ## Examples

      iex> update_boat(boat, %{field: new_value})
      {:ok, %Boat{}}

      iex> update_boat(boat, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_boat(%Boat{} = boat, attrs) do
    boat
    |> Boat.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Boat.

  ## Examples

      iex> delete_boat(boat)
      {:ok, %Boat{}}

      iex> delete_boat(boat)
      {:error, %Ecto.Changeset{}}

  """
  def delete_boat(%Boat{} = boat) do
    Repo.delete(boat)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking boat changes.

  ## Examples

      iex> change_boat(boat)
      %Ecto.Changeset{source: %Boat{}}

  """
  def change_boat(%Boat{} = boat) do
    Boat.changeset(boat, %{})
  end

  alias Atlantis.Business.Sailor

  @doc """
  Returns the list of sailors.

  ## Examples

      iex> list_sailors()
      [%Sailor{}, ...]

  """
  def list_sailors do
    Repo.all(Sailor)
  end

  def list_sailors(owner_id) do
    Repo.all(from s in Sailor, where: s.owner_id == ^owner_id)
  end

  @doc """
  Gets a single sailor.

  Raises `Ecto.NoResultsError` if the Sailor does not exist.

  ## Examples

      iex> get_sailor!(123)
      %Sailor{}

      iex> get_sailor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sailor!(id), do: Repo.get!(Sailor, id)

  @doc """
  Creates a sailor.

  ## Examples

      iex> create_sailor(%{field: value})
      {:ok, %Sailor{}}

      iex> create_sailor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sailor(attrs \\ %{}) do
    %Sailor{}
    |> Sailor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sailor.

  ## Examples

      iex> update_sailor(sailor, %{field: new_value})
      {:ok, %Sailor{}}

      iex> update_sailor(sailor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sailor(%Sailor{} = sailor, attrs) do
    sailor
    |> Sailor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Sailor.

  ## Examples

      iex> delete_sailor(sailor)
      {:ok, %Sailor{}}

      iex> delete_sailor(sailor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sailor(%Sailor{} = sailor) do
    Repo.delete(sailor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sailor changes.

  ## Examples

      iex> change_sailor(sailor)
      %Ecto.Changeset{source: %Sailor{}}

  """
  def change_sailor(%Sailor{} = sailor) do
    Sailor.changeset(sailor, %{})
  end

  alias Atlantis.Business.Schedule

  @doc """
  Returns the list of schedules.

  ## Examples

      iex> list_schedules()
      [%Schedule{}, ...]

  """
  def list_schedules do
    Repo.all(Schedule)
  end

  def list_schedules(owner_id) do
    Repo.all(
      from s in Schedule,
      where: s.owner_id == ^owner_id,
      preload: [:marine, :boat, :sailor]
    )
  end

  @doc """
  Gets a single schedule.

  Raises `Ecto.NoResultsError` if the Schedule does not exist.

  ## Examples

      iex> get_schedule!(123)
      %Schedule{}

      iex> get_schedule!(456)
      ** (Ecto.NoResultsError)

  """
  def get_schedule!(id), do: Repo.get!(Schedule, id)

  def get_schedule_with_preload!(id), do: Repo.get!(Schedule, id, preload: [:marine, :boat, :sailor])

  @doc """
  Creates a schedule.

  ## Examples

      iex> create_schedule(%{field: value})
      {:ok, %Schedule{}}

      iex> create_schedule(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_schedule(attrs \\ %{}) do
    %Schedule{}
    |> Schedule.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a schedule.

  ## Examples

      iex> update_schedule(schedule, %{field: new_value})
      {:ok, %Schedule{}}

      iex> update_schedule(schedule, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_schedule(%Schedule{} = schedule, attrs) do
    schedule
    |> Schedule.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Schedule.

  ## Examples

      iex> delete_schedule(schedule)
      {:ok, %Schedule{}}

      iex> delete_schedule(schedule)
      {:error, %Ecto.Changeset{}}

  """
  def delete_schedule(%Schedule{} = schedule) do
    Repo.delete(schedule)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking schedule changes.

  ## Examples

      iex> change_schedule(schedule)
      %Ecto.Changeset{source: %Schedule{}}

  """
  def change_schedule(%Schedule{} = schedule) do
    Schedule.changeset(schedule, %{})
  end
end
