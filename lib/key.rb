class Key

  def initialize(key = nil)
    @key = key
  end

  def create_random_key
    rand_num = []
    5.times do
      rand_num << rand(9)
    end
    rand_num
  end

  def compile_key
    rand_key = create_random_key
    combined_key = create_random_key.map.with_index do |n, index|
      n.to_s + rand_key[index + 1].to_s if index < 4
    end
    combined_key.pop
    combined_key
  end

  def rotations
    compile = compile_key
    {'A' => compile[0], 'B' => compile[1], 'C' => compile[2], 'D' => compile[3]}
  end



  # 1. create random key ONCE
  # 2. take that key and designate a, b, c,d
  # 3. complie abcd together to pass to other classes

#   def initialize(key = nil)
#     @key = key
#     @key_max = 99999
#   end
#
#   def create_key
#     num = Random.rand(@key_max)
#     @all_digits = num.to_s.rjust(5,'0')
#   end
#
#   def rotation_a
#     all_digits = create_key.to_s.chars
#     all_digits[0] + all_digits[1]
#   end
#
#   def rotation_b
#     all_digits = create_key.to_s.chars
#     all_digits[1] + all_digits[2]
#   end
#
#   def rotation_c
#     all_digits = create_key.to_s.chars
#     all_digits[2] + all_digits[3]
#   end
#
#   def rotation_d
#     all_digits = create_key.to_s.chars
#     all_digits[3] + all_digits[4]
#   end
#
#   def pass_key
#     create_key
#     [rotation_a, rotation_b, rotation_c, rotation_d]
#   end
#
end

@key = Key.new
print @key.compile_key
