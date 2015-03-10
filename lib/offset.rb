class Offset
  require 'date'

  attr_accessor :offset

  def initialize(date = nil)
    @date = date || Date.today.strftime('%d%m%y')
    generate_offset
  end

  def generate_offset
    self.offset = offset_sequence
  end

  def square
    @date.to_i * @date.to_i
  end

  def chars_to_ints(chars)
    chars.map do |element|
      element.to_i
    end
  end

  def offset_sequence
    chars = square.to_s.chars[-4..-1]
    chars_to_ints(chars)
  end

  def decrypt_offset(date)
    characters = (date.to_i * date.to_i).to_s.chars[-4..-1]
    chars_to_ints(characters)
  end
end
