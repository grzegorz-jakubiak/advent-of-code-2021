defmodule PowerConsumption do

  def calculate(input) do
    report = prepare_report(input)
    report
      |> Enum.map(fn row ->
        row
          |> Enum.min_max_by(fn x ->
            Enum.count(row, fn y -> y == x end)
          end)
      end)
      |> Enum.reduce({"", ""}, fn {min, max}, {first, last} ->
        {first <> min, last <> max}
      end)
      |> Tuple.to_list()
      |> Enum.map(fn binary ->
        {number, _} = Integer.parse(binary, 2)
        number
      end)
      |> List.to_tuple()
      |> Tuple.product()
  end

  defp prepare_report(input) when is_binary(input) do
    input
      |> String.split("\n")
      |> Enum.map(&String.trim/1)
      |> Enum.filter(&(String.length(&1) > 0))
      |> Enum.map(&String.split(&1, "", trim: true))
      |> transpose()
  end

  defp prepare_report(file) do
    case file do
      {:ok, content} -> prepare_report(content)
      {:error, _} -> []
    end
  end

  defp transpose(rows) do
    rows
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
  end
end
