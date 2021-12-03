ExUnit.start()

defmodule LifeSupportRatingTest do
  use ExUnit.Case

  test "calculate" do
    input = """
    00100
    11110
    10110
    10111
    10101
    01111
    00111
    11100
    10000
    11001
    00010
    01010
    """
    assert LifeSupportRating.calculate(input) == 230
  end
end
