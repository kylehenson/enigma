require_relative './rotator'
require_relative './key'
require_relative './offset'
require_relative './file_manager'

class Encryptor
  OPERATOR = '+'

  attr_reader :input_file_name, :output_file_name

  def initialize(input_file_name, output_file_name)
    @input_file_name = input_file_name
    @output_file_name = output_file_name
  end

  def encrypt
    rotator = Rotator.new(OPERATOR)
    encrypted_message = encrypt_message(rotator)
    FileManager.output(output_file_name, encrypted_message)
  end

  def encrypt_message(rotator)
    chunks        = FileManager.message(input_file_name).scan(/.{1,4}/)
    key           = Key.new
    master_key    = key.rotations
    offset        = Offset.new
    master_offset = offset.offset

    puts "Created 'encrypted.txt' with the key #{key.key.join} and date #{offset.date}"

    combinations = rotator.create_combinations(chunks, master_key, master_offset)
    scrambled_characters = rotator.set_rotate_parts(combinations).join
  end
end
