require_relative 'test_helper'
require_relative '../lib/encryptor'

class EncryptorTest < Minitest::Test

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
    assert Encryptor.new('message.txt', 'encrypted.txt')
  end

  def test_it_can_encrypt
    encryptor = Encryptor.new("test_file.txt", "test_encrypted.txt")

    assert_equal 8, encryptor.encrypt.size
  end

  def test_it_can_encrypt_a_message
    encryptor = Encryptor.new("message.txt", "encryptor.txt")

    assert encryptor.encrypt_message(Rotator.new('+'))
  end

end
