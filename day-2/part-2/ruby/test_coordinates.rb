require_relative 'coordinates'
require 'test/unit'

class TestCoordinates < Test::Unit::TestCase
  def test_calculate
    input = <<~TEXT
      forward 5
      down 5
      forward 8
      up 3
      down 8
      forward 2
    TEXT

    assert_equal(900, Coordinates.new.calculate(input))
  end
end