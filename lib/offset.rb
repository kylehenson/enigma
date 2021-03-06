class Offset
  require 'date'

  attr_reader :date, :offset

  def initialize(date = Date.today.strftime('%m%d%y'))
    @date = date
    generate_offset
  end

  def generate_offset
    @offset = offset_sequence
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
