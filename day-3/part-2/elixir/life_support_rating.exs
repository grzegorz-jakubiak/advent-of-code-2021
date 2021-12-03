defmodule LifeSupportRating do

  def calculate(input) do
    report = prepare_report(input)

    {oxygen_generator_rating, _} = report
      |> do_calculate(0, &oxygen_bit/1)
      |> Enum.join("")
      |> Integer.parse(2)

    {scrubber_rating, _} = report
      |> do_calculate(0, &scrubber_bit/1)
      |> Enum.join("")
      |> Integer.parse(2)

    oxygen_generator_rating * scrubber_rating
  end

  defp do_calculate([elem | []], _, _), do: elem

  defp do_calculate(report, index, criteria_function) do
    case report do
      [elem | []] ->
        elem

      ^report ->
        bit_count_at_index = calculate_bit_count_at_index(report, index)
        bit = criteria_function.(bit_count_at_index)

        report
          |> Enum.filter(fn number ->
            {pop, _} = List.pop_at(number, index)
            pop == bit
          end)
          |>do_calculate(index + 1, criteria_function)
    end
  end

  defp calculate_bit_count_at_index(report, index) do
    transposed_report = report |> transpose()

    case transposed_report
      |> Enum.map(fn row ->
        row
          |> Enum.map(fn x ->
            {x, Enum.count(row, fn y -> y == x end)}
          end)
          |> Enum.uniq()
      end)
      |> List.pop_at(index) do
        {elem, _} ->
          elem

        _ -> nil
    end
  end

  defp oxygen_bit([{bit, _} | []]), do: bit

  defp oxygen_bit([{bit1, count1} | [{bit2, count2}]]) do
    cond do
      count1 > count2 ->
        bit1
      count1 == count2 ->
        "1"
      count1 < count2 ->
        bit2
    end
  end

  defp scrubber_bit([{bit, _} | []]), do: bit

  defp scrubber_bit([{bit1, count1} | [{bit2, count2}]]) do
    cond do
      count1 > count2 ->
        bit2
      count1 == count2 ->
        "0"
      count1 < count2 ->
        bit1
    end
  end

  defp prepare_report(input) when is_binary(input) do
    input
      |> String.split("\n")
      |> Enum.map(&String.trim/1)
      |> Enum.filter(&(String.length(&1) > 0))
      |> Enum.map(&String.split(&1, "", trim: true))
  end

  defp prepare_report(file) do
    case file do
      {:ok, content} -> prepare_report(content)
      {:error, _} -> []
    end
  end

  defp transpose(rows) do
    rows
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
  end
end
