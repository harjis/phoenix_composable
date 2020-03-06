defmodule PhoenixComposable.Cars do
  @moduledoc """
  The Cars context.
  """

  import Ecto.Query, warn: false
  alias PhoenixComposable.Repo

  alias PhoenixComposable.Cars.Car

  @doc """
  Returns the list of cars.

  ## Examples

      iex> list_cars()
      [%Car{}, ...]

  """
  def list_cars do
    Repo.all(Car)
  end

  @doc """
  Gets a single car.

  Raises `Ecto.NoResultsError` if the Car does not exist.

  ## Examples

      iex> get_car!(123)
      %Car{}

      iex> get_car!(456)
      ** (Ecto.NoResultsError)

  """
  def get_car!(id), do: Repo.get!(Car, id)

  @doc """
  Creates a car.

  ## Examples

      iex> create_car(%{field: value})
      {:ok, %Car{}}

      iex> create_car(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_car(attrs \\ %{}) do
    %Car{}
    |> Car.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a car.

  ## Examples

      iex> update_car(car, %{field: new_value})
      {:ok, %Car{}}

      iex> update_car(car, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_car(%Car{} = car, attrs) do
    car
    |> Car.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a car.

  ## Examples

      iex> delete_car(car)
      {:ok, %Car{}}

      iex> delete_car(car)
      {:error, %Ecto.Changeset{}}

  """
  def delete_car(%Car{} = car) do
    Repo.delete(car)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking car changes.

  ## Examples

      iex> change_car(car)
      %Ecto.Changeset{source: %Car{}}

  """
  def change_car(%Car{} = car) do
    Car.changeset(car, %{})
  end

  alias PhoenixComposable.Cars.Engine

  @doc """
  Returns the list of engines.

  ## Examples

      iex> list_engines()
      [%Engine{}, ...]

  """
  def list_engines do
    Repo.all(Engine)
  end

  @doc """
  Gets a single engine.

  Raises `Ecto.NoResultsError` if the Engine does not exist.

  ## Examples

      iex> get_engine!(123)
      %Engine{}

      iex> get_engine!(456)
      ** (Ecto.NoResultsError)

  """
  def get_engine!(id), do: Repo.get!(Engine, id)

  @doc """
  Creates a engine.

  ## Examples

      iex> create_engine(%{field: value})
      {:ok, %Engine{}}

      iex> create_engine(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_engine(attrs \\ %{}) do
    %Engine{}
    |> Engine.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a engine.

  ## Examples

      iex> update_engine(engine, %{field: new_value})
      {:ok, %Engine{}}

      iex> update_engine(engine, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_engine(%Engine{} = engine, attrs) do
    engine
    |> Engine.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a engine.

  ## Examples

      iex> delete_engine(engine)
      {:ok, %Engine{}}

      iex> delete_engine(engine)
      {:error, %Ecto.Changeset{}}

  """
  def delete_engine(%Engine{} = engine) do
    Repo.delete(engine)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking engine changes.

  ## Examples

      iex> change_engine(engine)
      %Ecto.Changeset{source: %Engine{}}

  """
  def change_engine(%Engine{} = engine) do
    Engine.changeset(engine, %{})
  end

  alias PhoenixComposable.Cars.Specification

  @doc """
  Returns the list of specifications.

  ## Examples

      iex> list_specifications()
      [%Specification{}, ...]

  """
  def list_specifications do
    Repo.all(Specification)
  end

  @doc """
  Gets a single specification.

  Raises `Ecto.NoResultsError` if the Specification does not exist.

  ## Examples

      iex> get_specification!(123)
      %Specification{}

      iex> get_specification!(456)
      ** (Ecto.NoResultsError)

  """
  def get_specification!(id), do: Repo.get!(Specification, id)

  @doc """
  Creates a specification.

  ## Examples

      iex> create_specification(%{field: value})
      {:ok, %Specification{}}

      iex> create_specification(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_specification(attrs \\ %{}) do
    %Specification{}
    |> Specification.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a specification.

  ## Examples

      iex> update_specification(specification, %{field: new_value})
      {:ok, %Specification{}}

      iex> update_specification(specification, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_specification(%Specification{} = specification, attrs) do
    specification
    |> Specification.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a specification.

  ## Examples

      iex> delete_specification(specification)
      {:ok, %Specification{}}

      iex> delete_specification(specification)
      {:error, %Ecto.Changeset{}}

  """
  def delete_specification(%Specification{} = specification) do
    Repo.delete(specification)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking specification changes.

  ## Examples

      iex> change_specification(specification)
      %Ecto.Changeset{source: %Specification{}}

  """
  def change_specification(%Specification{} = specification) do
    Specification.changeset(specification, %{})
  end

  alias PhoenixComposable.Cars.Transmissions

  @doc """
  Returns the list of transmissions.

  ## Examples

      iex> list_transmissions()
      [%Transmissions{}, ...]

  """
  def list_transmissions do
    Repo.all(Transmissions)
  end

  @doc """
  Gets a single transmissions.

  Raises `Ecto.NoResultsError` if the Transmissions does not exist.

  ## Examples

      iex> get_transmissions!(123)
      %Transmissions{}

      iex> get_transmissions!(456)
      ** (Ecto.NoResultsError)

  """
  def get_transmissions!(id), do: Repo.get!(Transmissions, id)

  @doc """
  Creates a transmissions.

  ## Examples

      iex> create_transmissions(%{field: value})
      {:ok, %Transmissions{}}

      iex> create_transmissions(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_transmissions(attrs \\ %{}) do
    %Transmissions{}
    |> Transmissions.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a transmissions.

  ## Examples

      iex> update_transmissions(transmissions, %{field: new_value})
      {:ok, %Transmissions{}}

      iex> update_transmissions(transmissions, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_transmissions(%Transmissions{} = transmissions, attrs) do
    transmissions
    |> Transmissions.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a transmissions.

  ## Examples

      iex> delete_transmissions(transmissions)
      {:ok, %Transmissions{}}

      iex> delete_transmissions(transmissions)
      {:error, %Ecto.Changeset{}}

  """
  def delete_transmissions(%Transmissions{} = transmissions) do
    Repo.delete(transmissions)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking transmissions changes.

  ## Examples

      iex> change_transmissions(transmissions)
      %Ecto.Changeset{source: %Transmissions{}}

  """
  def change_transmissions(%Transmissions{} = transmissions) do
    Transmissions.changeset(transmissions, %{})
  end
end
