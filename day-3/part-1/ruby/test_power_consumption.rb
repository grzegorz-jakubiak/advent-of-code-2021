require_relative 'power_consumption'
require 'test/unit'

class TestPowerConsumption < Test::Unit::TestCase
  def test_calculate
    input = <<~TEXT
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
    TEXT

    assert_equal(198, PowerConsumption.new.calculate(input))
  end
end