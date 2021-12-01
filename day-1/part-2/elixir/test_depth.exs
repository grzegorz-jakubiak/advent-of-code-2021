ExUnit.start()

defmodule DepthTest do
  use ExUnit.Case

  test "count_sum_increase" do
    input = """
      199
      200
      208
      210
      200
      207
      240
      269
      260
      263
    """
    assert Depth.count_sum_increase(input) == 5
  end
end
