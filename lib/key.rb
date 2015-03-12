require 'pry'
require 'pry-byebug'

class Key
  attr_reader :key

  def create_random_key
    random_numbers = []
    5.times { random_numbers << rand(9) }
    random_numbers
  end

  # Argument named key_code because of class naming conflict
  
  def mash_keys(key_code = nil)
    @key = key_code || create_random_key
    @key.map.with_index do |number, index|
      number.to_s + @key[index + 1].to_s if index < 4
    end.compact!
  end

  def rotations
    compile = mash_keys
    [compile[0].to_i, compile[1].to_i, compile[2].to_i, compile[3].to_i]
  end

  def decrypt_code(key_code)
    digits = key_code.chars
    new_digits = digits.map.with_index do |number, index|
      number.to_s + key_code[index + 1].to_s
    end
    new_digits.pop
    new_digits.map! { |digit| digit.to_i }
  end
end
