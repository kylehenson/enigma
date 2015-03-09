class Key

  def initialize(key = nil)
    @key = key
  end

  def create_random_key
    random_numbers = []
    5.times { random_numbers << rand(9) }
    random_numbers
  end

  def compile_key
    key_one = create_random_key
    key_two = create_random_key
    mash_keys(key_one, key_two)
  end

  def mash_keys(key_one, key_two)
    key_one.map.with_index do |number, index|
      number.to_s + key_two[index + 1].to_s if index < 4
    end.compact!
  end

  def rotations
    compile = compile_key
    [compile[0].to_i, compile[1].to_i, compile[2].to_i, compile[3].to_i]
  end

end
