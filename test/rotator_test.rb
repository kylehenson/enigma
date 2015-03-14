require_relative 'test_helper'
require_relative '../lib/rotator'
require_relative '../lib/key'
require_relative '../lib/offset'
require 'pry'
require 'pry-byebug'

class RotatorTest < Minitest::Test

  def test_it_exists
    assert Rotator
  end

  def test_it_rotates_a_letter
    letter = "a"
    key = "9".to_i
    offset = 1
    rotator = Rotator.new('+')
    assert_equal 'k', rotator.rotate(letter, key, offset)
  end

  def test_it_negatively_rotates_a_letter
    letter = "a"
    key = "9".to_i
    offset = 1
    rotator = Rotator.new('-')
    assert_equal '3', rotator.rotate(letter, key, offset)
  end

  def test_it_rotates_another_letter
    letter = "d"
    key = "1".to_i
    offset = 9
    rotator = Rotator.new('+')
    assert_equal 'n', rotator.rotate(letter, key, offset)
  end

  def test_it_rotates_a_number
    letter = "2"
    key = "1".to_i
    offset = 9
    rotator = Rotator.new('+')
    assert_equal ",", rotator.rotate(letter, key, offset)
  end

  def test_it_rotates_a_character
    letter = "."
    key = "1".to_i
    offset = 9
    rotator = Rotator.new('+')
    assert_equal 'i', rotator.rotate(letter, key, offset)
  end

  def test_it_rotates_a_character_negatively
    letter = "."
    key = "3".to_i
    offset = 9
    rotator = Rotator.new('-')
    assert_equal 'z', rotator.rotate(letter, key, offset)
  end

  def test_it_rotates_number_higher_than_map_count
    letter = "d"
    key = "20".to_i
    offset = 23
    rotator = Rotator.new('+')
    assert_equal 'h', rotator.rotate(letter, key, offset)
  end

  def test_it_rotates_number_higher_than_map_count_negatively
    letter = "d"
    key = "20".to_i
    offset = 23
    rotator = Rotator.new('-')
    assert_equal ',', rotator.rotate(letter, key, offset)
  end

  def test_it_can_rotate_without_explicit_offset
    letter = 'd'
    key = 5
    rotator = Rotator.new('+')
    assert_equal 'i', rotator.rotate(letter,key)
  end

  def test_it_can_calculate_an_index
    assert_equal 5, Rotator.new('+').calculate_index('a', 5)
  end

  def test_it_can_create_combinations
    chunks = ["abcd"]
    master_key = [74,41,18,82]
    master_offset = [9,2,2,5]

    assert_equal [["a", 74, 9],["b", 41, 2],["c", 18, 2],["d", 82, 5]], Rotator.new('+').create_combinations(chunks, master_key, master_offset)
  end

  def test_it_can_create_combinations_without_explicit_offset
    chunks = ["abcd"]
    master_key = [74,41,18,82]

    assert_equal [["a", 74],["b", 41],["c", 18],["d", 82]], Rotator.new('+').create_combinations(chunks, master_key)
  end

  def test_it_can_set_rotate_parts
    rotator = Rotator.new('+')

    combinations = ["f", 74, 9],["r", 41, 2],["i", 18, 2],["d", 82, 5]

    assert_equal ["k","v","2","m"],rotator.set_rotate_parts(combinations)
  end

  def test_it_can_set_rotate_parts_for_decryption
    rotator = Rotator.new('-')

    combinations = ["f", 74, 9],["r", 41, 2],["i", 18, 2],["d", 82, 5]

    assert_equal ["a","n","1","7"],rotator.set_rotate_parts(combinations)
  end

  def test_it_can_combine_key_and_offset
    rotator = Rotator.new('+')

    key = [74, 41, 18, 82]
    date = [9,2,2,5]

    assert_equal [83, 43, 20, 87], rotator.combine_key_and_offset(key,date)
  end
end
