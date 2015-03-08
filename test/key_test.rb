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

  def test_it_compiles_key
    assert_equal 4, @key.compile_key.size
  end

  def test_it_names_rotations
    assert @key.rotations.is_a?(Array)
    assert_equal 4, @key.rotations.size
  end

  # def test_key_is_String
  #   skip
  #
  #   assert_equal String, key.create_key.class
  # end
  #
  # def test_it_can_generate_random_key
  #   key1 = key.create_key
  #   key2 = key.create_key
  #
  #   refute_equal key1, key2
  # end
  #
  # def test_it_can_find_A_rotation
  #   skip
  #   create_key = "10000"
  #
  #   assert_equal "10", key.rotation_a(create_key)
  # end
  #
  # def test_it_can_find_another_A_rotation
  #   skip
  #   create_key = "05678"
  #
  #   assert_equal "05", key.rotation_a(create_key)
  # end
  #
  # def test_it_can_find_B_rotation
  #   skip
  #   create_key = "10101"
  #
  #   assert_equal "01", key.rotation_b(create_key)
  # end
  #
  # def test_it_can_find_B_another_rotation
  #   skip
  #   create_key = "23948"
  #
  #   assert_equal "39", key.rotation_b(create_key)
  # end
  #
  # def test_it_can_find_C_rotation
  #   skip
  #   create_key = "10101"
  #
  #   assert_equal "10", key.rotation_c(create_key)
  # end
  #
  # def test_it_can_find_D_rotation
  #   skip
  #   create_key = "10101"
  #
  #   assert_equal "01", key.rotation_d(create_key)
  # end
  #
  # def test_that_key_is_generated
  #   key = "10101"
  #   assert_equal ["10", "01", "10", "01"], @key.pass_key
  # end
  #
end
