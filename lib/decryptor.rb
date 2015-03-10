require_relative './rotator'

class Decryptor
  attr_reader :input_file_name

  def initialize(input_file_name, output_file_name, key, date)
    @input_file_name = input_file_name
    @output_file_name = output_file_name
    @key = key
    @date = date
  end

  def read_lines
    File.open(input_file_name).read
  end

  def decrypt
    message = read_lines
    rotator = Rotator.new
    decrypted_message = rotator.decrypt_message(message, @key, @date)
    output(decrypted_message)
  end

  def output(decrypted_message)
    output_file = File.open(@output_file_name, 'w') { |file| file.write(decrypted_message) }
  end

end
