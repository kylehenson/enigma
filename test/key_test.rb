require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/key'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new
  end

  def test_it_exists
    assert @key
  end

  def test_key_is_fixnum
    key = @key.create_key

    assert_equal String, key.class
  end

  def test_it_can_generate_random_key
    key1 = @key.create_key
    key2 = @key.create_key

    refute_equal key1, key2
  end

  def test_it_can_find_A_rotation
    create_key = "10000"

    assert_equal "10", @key.rotation_a(create_key)
  end

  def test_it_can_find_another_A_rotation
    create_key = "05678"

    assert_equal "05", @key.rotation_a(create_key)
  end

  def test_it_can_find_B_rotation
    create_key = "10101"

    assert_equal "01", @key.rotation_b(create_key)
  end

  def test_it_can_find_B_another_rotation
    create_key = "23948"

    assert_equal "39", @key.rotation_b(create_key)
  end

  def test_it_can_find_C_rotation
    create_key = "10101"

    assert_equal "10", @key.rotation_c(create_key)
  end

  def test_it_can_find_D_rotation
    create_key = "10101"

    assert_equal "01", @key.rotation_d(create_key)
  end


end
