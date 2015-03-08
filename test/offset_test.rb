require_relative 'test_helper'
require_relative '../lib/offset'

class OffsetTest < Minitest::Test
  attr_accessor :offset

  def setup
    date = "020315"
    @offset = Offset.new(date)
  end

  def test_it_exists
    assert @offset
  end

  def test_it_squares_date
    assert_equal 412699225, offset.square
  end

  def test_it_finds_last_four_digits_of_squared_date
    assert_equal [9, 2, 2, 5], offset.offset_sequence
  end
end
