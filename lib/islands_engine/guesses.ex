defmodule IslandsEngine.Guesses do
#  alias __MODULE__
  alias IslandsEngine.{Coordinate, Guesses}
#  @moduledoc false


  @enforce_keys [:misses, :hits] # makes the keys to be required when creating the structure
  defstruct [:hits, :misses]
#  @enforce_keys [:hits, :misses]
#  defstruct[:hits, :misses]

  def new(),do: %Guesses{hits: MapSet.new(), misses: MapSet.new()}

  def add(%Guesses{} = guesses, :hit, %Coordinate{} = coordinate), do:
    update_in(guesses.hits, &MapSet.put(&1, coordinate))

  def add(%Guesses{} = guesses, :miss, %Coordinate{} = coordinate), do:
    update_in(guesses.misses, &MapSet.put(&1, coordinate))

end
