defmodule IslandsEngine.Coordinate do
  # allow to make dirrect reference to a module without calling it eg: %Coordinate{} instead of %IslandsEgnine.Coordinate{}
  alias __MODULE
#  @moduledoc false

  @enforce_keys [:row, :col] # makes the keys to be required when creating the structure
  defstruct [:row, :col]

  def new(row,col) do
    {:ok, %Coordinate{row: row, col: col}}
  end

end
