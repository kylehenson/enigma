require_relative 'test_helper'
require_relative '../lib/key'

class KeyTest < Minitest::Test
  attr_accessor :key

  def setup
    @key = Key.new
  end

  def test_it_exists
    assert key
  end

  def test_it_generates_random_keys
    key1 = Key.new.create_random_key
    key2 = Key.new.create_random_key

    refute_equal key1, key2
  end

  def test_it_names_rotations
    assert @key.rotations.is_a?(Array)
    assert_equal 4, @key.rotations.size
  end

  def test_it_changes_key_output_for_decrypt
    key_code = "12345"

    assert_equal [12, 23, 34, 45], key.decrypt_code(key_code)
  end

end
