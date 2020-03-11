defmodule PhoenixComposable.Cars.SomeModule do
  @type t :: %__MODULE__{
               a: number,
             }

  defstruct a: 0

  @spec get_list() :: list(t())
  def get_list() do
    [%__MODULE__{a: 1}]
  end

  @spec list_of_structs(list(t())) :: list(t())
  def list_of_structs(list) do
    list
  end

  @spec list_has_a_one(list(t())) :: boolean
  def list_has_a_one(list) do
    l = list
          |> Enum.find(&(&1.b == 1))
    l != nil
  end

  @spec list_of_numbers(list(number)) :: list(number)
  def list_of_numbers(list) do
    list
  end
end

defmodule PhoenixComposable.Cars.OtherModule do
  @type t :: %__MODULE__{
               b: boolean,
             }

  defstruct b: false

  alias PhoenixComposable.Cars.SomeModule

  @spec do_something() :: list(%SomeModule{})
  def do_something() do
    list = [%SomeModule{a: 1}]
    other_list = SomeModule.list_of_structs(list)
#    wrong_list = [1]
#    should_fail = SomeModule.list_of_structs(wrong_list)
  end

  def do_somethingelse() do
    list = [%SomeModule{a: 1}]
#    list = [%SomeModule{b: 1}]
    has_one = SomeModule.list_has_a_one(list)
    other_list = some_list(SomeModule.get_list())
#    other_list = my_list(SomeModule.get_list())
  end

  @spec some_list(list(%SomeModule{})) :: list(%SomeModule{})
  def some_list(list) do
    list
  end


  @spec my_list(list(%__MODULE__{})) :: list(%__MODULE__{})
  def my_list(list) do
    list
  end
end
