ExUnit.start()

defmodule CoordinatesTest do
  use ExUnit.Case

  test "calculate" do
    input = """
      forward 5
      down 5
      forward 8
      up 3
      down 8
      forward 2
    """
    assert Coordinates.calculate(input) == 150
  end
end
