require_relative 'test_helper'
require_relative '../lib/decryptor'

class DecryptorTest < Minitest::Test

  def test_it_exists
    assert Decryptor.new
  end

end
