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

  def test_it_formats_date
    
  end

end
