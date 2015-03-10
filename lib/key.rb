require 'pry'
require 'pry-byebug'
class Key
  attr_reader :key

  def initialize(key = nil)
    @key = key
  end

  def create_random_key
    random_numbers = []
    5.times { random_numbers << rand(9) }
    random_numbers
  end

  def mash_keys
    new_key = []
    @key = create_random_key
    @key.each_with_index do |number, index|
      new_key << number.to_s + key[index + 1].to_s if index < 4
    end.compact!
    new_key
  end

  def rotations
    compile = mash_keys
    [compile[0].to_i, compile[1].to_i, compile[2].to_i, compile[3].to_i]
  end

#argument named key_code because of class naming conflict

  def decrypt_code(key_code)
    digits = key_code.chars
    new_digits = digits.map.with_index do |number, index|
      number.to_s + key_code[index + 1].to_s
    end
    new_digits.pop
    new_digits.map! { |digit| digit.to_i }
  end

end
