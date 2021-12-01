ExUnit.start()

defmodule DepthTest do
  use ExUnit.Case

  test "count_increase" do
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
    assert Depth.count_increase(input) == 7
  end
end
