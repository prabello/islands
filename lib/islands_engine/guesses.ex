defmodule IslandsEngine.Guesses do
  alias __MODULE__
#  @moduledoc false


  @enforce_keys [:misses, :hits] # makes the keys to be required when creating the structure
  defstruct [:hits, :misses]
#  @enforce_keys [:hits, :misses]
#  defstruct[:hits, :misses]

  def new(),do: %Guesses{hits: MapSet.new(), misses: MapSet.new()}
end
