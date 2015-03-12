require_relative './rotator'
require_relative './key'
require_relative './offset'
require_relative './file_manager'

class Decryptor
  OPERATOR = '-'

  attr_reader :input_file_name, :output_file_name, :key, :date

  def initialize(input_file_name, output_file_name, key, date)
    @input_file_name = input_file_name
    @output_file_name = output_file_name
    @key = key
    @date = date
  end

  def decrypt
    puts "Created 'decrypted.txt' with the key #{key} and date #{date}"
    rotator = Rotator.new(OPERATOR)
    decrypted_message = decrypt_message(rotator)
    FileManager.output(output_file_name, decrypted_message)
  end

  def decrypt_message(rotator)
    chunks        = FileManager.message(input_file_name).scan(/.{1,4}/)
    master_key    = Key.new.decrypt_code(key)
    master_offset = Offset.new.decrypt_offset(date)

    combinations = rotator.create_combinations(chunks, master_key, master_offset)
    rotator.set_rotate_parts(combinations).join
  end
end
