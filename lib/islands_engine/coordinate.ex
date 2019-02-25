defmodule IslandsEngine.Coordinate do
  # allow to make dirrect reference to a module without calling it eg: %Coordinate{} instead of %IslandsEgnine.Coordinate{}
  alias __MODULE__
#  @moduledoc false

  @enforce_keys [:row, :col] # makes the keys to be required when creating the structure
  defstruct [:row, :col]

  @board_range 1..10

  def new(row,col) when row in(@board_range) and col in(@board_range) do
    {:ok, %Coordinate{row: row, col: col}}
  end

  def new(_row,_col),do: {:error,:invalid_coordinate}

#  Same as the one above
#  def new(_row,_col) do
#    {:error,:invalid_coordinate}
#  end

end
