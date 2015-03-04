class Key

  def initialize
    @key_max = 99999
  end

  def create_key
    num = Random.rand(@key_max)
    num.to_s.rjust(5,'0')
  end

  def rotation_a(create_key)
    digits = create_key.to_s.chars
    joined = digits[0] + digits[1]
  end

  def rotation_b(create_key)
    digits = create_key.to_s.chars
    joined = digits[1] + digits[2]
  end

  def rotation_c(create_key)
    digits = create_key.to_s.chars
    joined = digits[2] + digits[3]
  end

  def rotation_d(create_key)
    digits = create_key.to_s.chars
    joined = digits[3] + digits[4]
  end

end

puts Key.new.create_key
