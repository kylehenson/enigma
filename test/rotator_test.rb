require_relative 'test_helper'
require_relative '../lib/rotator'

class RotatorTest < Minitest::Test
  attr_accessor :rotator

  def setup
    @rotator = Rotator.new
  end

  def test_it_exists
    assert rotator
  end

  def test_it_rotates_a_letter
    letter = "a"
    key = "9".to_i
    offset = 1
    assert_equal 'k', rotator.rotate(letter, key, offset)
  end

  def test_it_rotates_another_letter
    letter = "d"
    key = "1".to_i
    offset = 9
    assert_equal 'n', rotator.rotate(letter, key, offset)
  end

  def test_it_rotates_another_letter
    letter = "d"
    key = "10".to_i
    offset = 23
    assert_equal ' ', rotator.rotate(letter, key, offset)
  end

  def test_it_rotates_number_higher_than_map_count
    letter = "d"
    key = "20".to_i
    offset = 23
    assert_equal 'h', rotator.rotate(letter, key, offset)
  end

  def test_it_rotates_two_letters
    skip
    chunk = "ab"
    rotator.parse(chunk)
    letter = ['a','b']
    key = "9".to_i
    offset = 1
    assert_equal 'kl', rotator.rotate(letter, key, offset)
  end

end
