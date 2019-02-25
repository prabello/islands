defmodule IslandsEngine.Island do
#  @moduledoc false

  alias IslandsEngine.{Coordinate, Island}

  @enforce_keys [:coordinates, :hit_coordinates]
  defstruct [:coordinates, :hit_coordinates]

  def new(), do:
    %Island{coordinates: MapSet.new(), hit_coordinates: MapSet.new()}

  defp offset(:square), do: [{0,0},{0,1},{1,0},{1,1}]

  defp offset(:atoll), do: [{0,0},{0,1},{1,1},{2,0},{2,1}]

  defp offset(:dot), do: [{0,0}]

  defp offset(:l_shape), do: [{0,0},{1,0},{2,0},{2,1}]

  defp offset(:s_shape), do: [{0,1},{0,2},{1,0},{1,1}]

  defp offset(_), do: {:error, :invalid_island_type}

  defp add_coordinates(offsets, upper_left) do
    Enum.reduce_while(offsets, MapSet.new(), fn offset,acc ->
      add_coordinates(acc,upper_left,offset)
    end)
  end

  defp add_coordinate(coordinates, %Coordinates{row:row, col: col}, {row_offset, col_offset}) do
    case Coordinate.new(row+ row_offset, col+ col_offset) do
        {:ok, coordinate} -> {:cont, MapSet.put(coordinates,coordinate)}
        {:error, :invalid_coordinate} -> {:halt, {:error, :invalid_coordinate}}
                                                          end
  end

end
