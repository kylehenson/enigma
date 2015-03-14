require_relative 'test_helper'
require_relative '../lib/decryptor'

class DecryptorTest < Minitest::Test

  def setup
    @test_file = File.new("test_file.txt", "w+")
    @test_file.write("a cookie a day")
    @test_file.close
    @test_file2 = File.new("test_file2.txt", "w+")
    @test_file2.write("one more cookie a day")
    @test_file2.close
  end

  def teardown
    File.delete("test_file.txt")
    File.delete("test_file2.txt")
  end

  def test_it_exists
    assert Decryptor.new('encrypted.txt', 'decrypted', 12345, 9225)
  end

  def test_it_can_decrypt
    decryptor = Decryptor.new("encrypted.txt", "decryptor.txt", "12345", "9225")

    assert_equal 8, decryptor.decrypt.size
  end

  def test_it_can_decrypt_a_message
    decryptor = Decryptor.new("encrypted.txt", "decryptor.txt", "12345", "9225")

    assert decryptor.decrypt_message(Rotator.new('-'))
  end

end
