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

  def test_it_can_read_contents_of_file
    decryptor = Decryptor.new("test_file.txt", "test_encrypted.txt", 12345, 9225)

    assert_equal "a cookie a day", decryptor.read_lines
  end

  def test_it_can_read_contents_of_another_file
    decryptor = Decryptor.new("test_file2.txt", "test_encrypted.txt", 12345, 9225)

    assert_equal "one more cookie a day", decryptor.read_lines
  end

  def test_when_call_output_it_writes_contents_of_file
    decryptor = Decryptor.new("encrypted.txt", "decryptor.txt", 12345, 9225)

    decrypted_message = "get to the gym"

    assert_equal 14, decryptor.output(decrypted_message)
  end

  def test_when_call_output_it_overwrites_content_of_output_file
    decryptor = Decryptor.new("encrypted.txt", "decryptor.txt", 12345, 9225)

    decrypted_message = "no more cookies"

    assert_equal 15, decryptor.output(decrypted_message)
  end

end
