require 'pry'
require_relative 'rotator'

class Encryptor
  attr_reader :input_file_name

  def initialize(input_file_name, output_file_name)
    @input_file_name = input_file_name
    @output_file_name = output_file_name
  end

  def read_lines
    File.open(input_file_name).read
  end

  def encrypt
    message = read_lines
    rotator = Rotator.new
    encrypted_message = rotator.encrypt_message(message)
    output(encrypted_message)
  end

  def output(encrypted_message)
    output_file = File.open(@output_file_name, 'w') { |file| file.write(encrypted_message) }
  end

end
