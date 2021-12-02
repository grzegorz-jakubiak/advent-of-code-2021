defmodule Coordinates do

  def calculate(input) do
    directions = prepare_directions(input)
    directions
      |> Enum.reduce({0, 0}, fn direction, acc ->
        move(direction, acc)
      end)
      |> Tuple.product()
  end

  defp prepare_directions(input) when is_binary(input) do
    input
      |> String.split("\n")
      |> Enum.map(&String.trim/1)
      |> Enum.filter(&(String.length(&1) > 0))
  end

  defp prepare_directions(file) do
    case file do
      {:ok, content} -> prepare_directions(content)
      {:error, _} -> []
    end
  end

  defp move(<<"forward ", number::binary>>, {x, y}) do
    {number, _} = Integer.parse(number)
    {x + number, y}
  end

  defp move(<<"up ", number::binary>>, {x, y}) do
    {number, _} = Integer.parse(number)
    {x, y - number}
  end

  defp move(<<"down ", number::binary>>, {x, y}) do
    {number, _} = Integer.parse(number)
    {x, y + number}
  end
end
