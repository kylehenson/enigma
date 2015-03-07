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

  def test_it_rotates_a_number
    skip
    letter = "2"
    key = "1".to_i
    offset = 9
    assert_equal ",", rotator.rotate(letter, key, offset)
  end

  def test_it_rotates_a_character
    letter = "."
    key = "1".to_i
    offset = 9
    assert_equal 'i', rotator.rotate(letter, key, offset)
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
    chunk = "ab"
    message = rotator.parse(chunk)
    key = "9".to_i
    offset = 1
    assert_equal 'kl', rotator.rotate_message(message, key, offset)
  end

  def test_it_rotates_three_letters
    chunk = ", a"
    message = rotator.parse(chunk)
    key = "2".to_i
    offset = 1
    assert_equal 'cad', rotator.rotate_message(message, key, offset)
  end

  def test_it_rotates_four_letters
    chunk = ", a8"
    message = rotator.parse(chunk)
    key = "2".to_i
    offset = 1
    assert_equal 'cad.', rotator.rotate_message(message, key, offset)
  end

  # def test_it_rotates_two_characters_with_different_rotations
  #   chunk = "ab"
  #   message = rotator.parse(chunk)
  #   assert_equal ''
  # end

end
