require_relative 'test_helper'
require_relative '../lib/rotator'
require_relative '../lib/key'
require_relative '../lib/offset'
require 'pry'
require 'pry-byebug'

class RotatorTest < Minitest::Test
  attr_accessor :rotator, :mock_key, :mock_offset, :mock_key2, :mock_offset2

  def setup
    @rotator = Rotator.new

    @mock_key = MiniTest::Mock.new
    @mock_key.expect(:rotations, [12, 23, 34, 45])

    @mock_offset = MiniTest::Mock.new
    @mock_offset.expect(:offset, [1, 2, 3, 4])


    @mock_key2 = MiniTest::Mock.new
    @mock_key2.expect(:rotations, [-12, -23, -34, -45])

    @mock_offset2 = MiniTest::Mock.new
    @mock_offset2.expect(:offset, [-1, -2, -3, -4])
  end

  def test_it_exists
    assert rotator
  end

  # rotate method

  def test_it_rotates_a_letter
    letter = "a"
    key = "9".to_i
    offset = 1
    assert_equal 'k', rotator.rotate(letter, key, offset)
  end

  def test_it_negatively_rotates_a_letter
    letter = "a"
    key = "-9".to_i
    offset = -1
    assert_equal '3', rotator.rotate(letter, key, offset)
  end

  def test_it_rotates_another_letter
    letter = "d"
    key = "1".to_i
    offset = 9
    assert_equal 'n', rotator.rotate(letter, key, offset)
  end

  def test_it_rotates_a_number
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

  def test_it_rotates_a_character_negatively
    letter = "."
    key = "-3".to_i
    offset = -9
    assert_equal 'z', rotator.rotate(letter, key, offset)
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

  def test_it_rotates_number_higher_than_map_count_negatively
    letter = "d"
    key = "-20".to_i
    offset = -23
    assert_equal ',', rotator.rotate(letter, key, offset)
  end

  # rotate_message

  def test_it_rotates_a_single_chunk_with_one_letter
    Offset.stub(:new, mock_offset) do
      Key.stub(:new, mock_key) do
        assert_equal 'n', rotator.encrypt_message('a')
      end
    end
  end

  def test_it_rotates_a_single_chunk_with_one_letter_negatively
    Offset.stub(:new, mock_offset2) do
      Key.stub(:new, mock_key2) do
        assert_equal '0', rotator.encrypt_message('a')
      end
    end
  end

  def test_it_rotates_a_single_chunk_with_two_characters
    Offset.stub(:new, mock_offset) do
      Key.stub(:new, mock_key) do
        assert_equal 'nn', rotator.encrypt_message('a1')
      end
    end
  end

  def test_it_rotates_a_single_chunk_with_two_characters_negatively
    Offset.stub(:new, mock_offset2) do
      Key.stub(:new, mock_key2) do
        assert_equal '0c', rotator.encrypt_message('a1')
      end
    end
  end

  def test_it_rotates_a_single_chunk_with_three_characters
    Offset.stub(:new, mock_offset) do
      Key.stub(:new, mock_key) do
        assert_equal 'n0z', rotator.encrypt_message('ab1')
      end
    end
  end

  def test_it_rotates_a_single_chunk_with_four_characters
    Offset.stub(:new, mock_offset) do
      Key.stub(:new, mock_key) do
        assert_equal 'n0zj', rotator.encrypt_message('ab1,')
      end
    end
  end

  def test_it_rotates_two_chunks
    Offset.stub(:new, mock_offset) do
      Key.stub(:new, mock_key) do
        assert_equal 'n0a.cy9h', rotator.encrypt_message('abc12,. ')
      end
    end
  end

  def test_it_rotates_two_chunks_negatively
    Offset.stub(:new, mock_offset2) do
      Key.stub(:new, mock_key2) do
        assert_equal '0perpna0', rotator.encrypt_message('abc12,. ')
      end
    end
  end

  def test_it_rotates_three_chunks
    Offset.stub(:new, mock_offset) do
      Key.stub(:new, mock_key) do
        assert_equal 'n0a.cy9hhmxj', rotator.encrypt_message('abc12,. 70z,')
      end
    end
  end

  def test_it_rotates_three_chunks_negatively
    Offset.stub(:new, mock_offset2) do
      Key.stub(:new, mock_key2) do
        assert_equal '0perpna0ub12', rotator.encrypt_message('abc12,. 70z,')
      end
    end
  end

end
