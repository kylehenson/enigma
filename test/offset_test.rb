require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/offset'

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new
  end

  def test_it_exists
    assert @offset
  end

  def test_it_squares_date
    date = "020315"

    assert_equal 412699225, @offset.square(date)
  end

  def test_it_finds_last_four_digits_of_squared_date
    date = "020315"

    squared = @offset.square(date)

    assert_equal ["9", "2", "2", "5"], @offset.offset_sequence(squared)
  end

  def test_it_can_find_offset_A
    date = "020315"

    squared = @offset.square(date)

    digits = squared.to_s.chars[-4..-1]

    assert_equal 9, @offset.offset_a(digits)
  end

  def test_it_can_find_offset_B
    date = "020315"

    squared = @offset.square(date)

    digits = squared.to_s.chars[-4..-1]

    assert_equal 2, @offset.offset_b(digits)
  end

  def test_it_can_find_offset_C
    date = "020315"

    squared = @offset.square(date)

    digits = squared.to_s.chars[-4..-1]

    assert_equal 2, @offset.offset_c(digits)
  end

  def test_it_can_find_offset_D
    date = "020315"

    squared = @offset.square(date)

    digits = squared.to_s.chars[-4..-1]

    assert_equal 5, @offset.offset_d(digits)
  end

end
