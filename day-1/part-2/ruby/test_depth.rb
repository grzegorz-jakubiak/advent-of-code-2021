require_relative 'depth'
require 'test/unit'

class TestDepth < Test::Unit::TestCase
  def test_count_sum_increase
    input = <<~TEXT
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
    TEXT

    assert_equal(5, Depth.new.count_sum_increase(input))
  end
end