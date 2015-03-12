require_relative './rotator'
require_relative './key'
require_relative './offset'
require_relative './file_manager'

class Cracker
  OPERATOR = '-'

  attr_reader :input_file_name, :output_file_name, :date

  def initialize(input_file_name, output_file_name, date)
    @input_file_name  = input_file_name
    @output_file_name = output_file_name
    @date = date
  end

  def format_number(number)
    number.rjust(5, "0").chars
  end

  def crack
    ("0".."99999").each do |number|
      key = format_number(number)
      decrypted_message = crack_message(key)
      if match?(decrypted_message)
        print_success_message(key.join)
        FileManager.output(output_file_name, decrypted_message)
        break
      end
    end
  end

  def crack_message(key_guess)
    key         = Key.new
    key_mash    = key.mash_keys(key_guess)
    date_offset = Offset.new(date).offset
    rotator     = Rotator.new(OPERATOR)
    crack_rotation = rotator.combine_key_and_offset(key_mash, date_offset)
    start_crack(rotator, crack_rotation)
  end

  def start_crack(rotator, crack_rotation)
    chunks       = FileManager.message(input_file_name).scan(/.{1,4}/)
    combinations = rotator.create_combinations(chunks, crack_rotation)
    rotator.set_rotate_parts(combinations).join
  end

  def match?(decrypted_message)
    decrypted_message[-7..-1] == "..end.."
  end

  def print_success_message(key)
    puts "Created 'cracked.txt' with the cracked key #{key} and date #{date}"
  end
end
