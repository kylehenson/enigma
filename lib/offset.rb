class Offset
  attr_accessor :offset_a,
                :offset_b,
                :offset_c,
                :offset_d

  def initialize(date)
    @date = date
    create
  end

  def create
    digits = offset_sequence

    @offset_a = digits.shift
    @offset_b = digits.shift
    @offset_c = digits.shift
    @offset_d = digits.shift
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
end
