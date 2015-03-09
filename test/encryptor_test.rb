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

  def test_it_can_read_contents_of_file
    encryptor = Encryptor.new("test_file.txt", "test_encrypted.txt")

    assert_equal "a cookie a day", encryptor.read_lines
  end

  def test_it_can_read_contents_of_another_file
    encryptor = Encryptor.new("test_file2.txt", "test_encrypted.txt")

    assert_equal "one more cookie a day", encryptor.read_lines
  end

  def test_when_call_output_it_writes_contents_of_file
    encryptor = Encryptor.new("message.txt", "encryptor.txt")

    encrypted_message = "get to the gym"

    assert_equal 14, encryptor.output(encrypted_message)
  end

  def test_when_call_output_it_overwrites_content_of_output_file
    encryptor = Encryptor.new("message.txt", "encryptor.txt")

    encrypted_message = "no more cookies"

    assert_equal 15, encryptor.output(encrypted_message)
  end

  # def test_it_warns_user_when_output_file_exists
  #   encryptor = Encryptor.new('message.txt', 'encrypted.txt')
  #
  #   assert File.exist?('message.txt')
  #   refute File.exist?('encrypted.txt')
  #
  #   encryptor.encrypt
  #   assert File.exist?('encypted.txt')
  # end
  #
  # def test_it_returns_error_if_input_or_output_file_is_missing
  #   encryptor = Encryptor.new('message.txt')
  #
  #   assert_equal "Please provide valid input and output files.", encryptor.encrypt
  # end

end
