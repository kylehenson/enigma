require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/character_map'

class CharacterMapTest < Minitest::Test

  def test_it_exists
    assert CharacterMap.new
  end

  def test_it_contains_characters_map
    assert_equal ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9',' ','.',','], CharacterMap.new.characters
  end

end
