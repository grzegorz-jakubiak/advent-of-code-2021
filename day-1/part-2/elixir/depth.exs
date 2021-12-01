defmodule Depth do
  def count_sum_increase(input) do
    sonar_sweep_report = prepare_sonar_sweep_report(input)

    sonar_sweep_report
    |> Enum.chunk_every(3,1)
    |> Enum.map(fn list -> list ++ [0] end)
    |> Enum.filter(fn list -> Enum.count(list) == 4 end)
    |> Enum.map(&Enum.sum/1)
    |> Enum.chunk_every(2,1, :discard)
    |> Enum.count(fn [first | last] ->
      List.first(last) > first
    end)
  end

  defp prepare_sonar_sweep_report(content) when is_binary(content) do
    content |> String.split() |> Enum.map(&String.to_integer/1)
  end

  defp prepare_sonar_sweep_report(file) do
    case file do
      {:ok, content} -> content |> String.split() |> Enum.map(&String.to_integer/1)
      {:error, _} -> []
    end
  end
end
