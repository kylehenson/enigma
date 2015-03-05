# Consider the date in the format DDMMYY, like 020315
# Square the numeric form (412699225) and find the last four digits (9225)
# The first digit is the "A offset" (9)
# The second digit is the "B offset" (2)
# The third digit is the "C offset" (2)
# The fourth digit is the "D offset" (5)

class Offset

  def square(date)
    squared = date.to_i * date.to_i
  end

  def offset_sequence(squared)
    digits = squared.to_s.chars[-4..-1]
  end

  def offset_a(digits)
    digits[0].to_i
  end

  def offset_b(digits)
    digits[1].to_i
  end

  def offset_c(digits)
    digits[2].to_i
  end

  def offset_d(digits)
    digits[3].to_i
  end
  
end
