require_relative 'character_map'

class Rotator
  attr_reader :map, :operator

  def initialize(operator)
    @map = CharacterMap.characters
    @operator = operator
  end

  def rotate(character, key, offset = nil)
    total_rotation = offset ? key + offset : key
    new_index = calculate_index(character, total_rotation)
    map[new_index]
  end

  def calculate_index(character, total_rotation)
    (map.index(character).send(operator, total_rotation)) % map.length
  end

  def create_combinations(chunks, master_key, master_offset = nil)
    if master_offset
      chunks.flat_map { |chunk| chunk.chars.zip(master_key, master_offset) }
    else
      chunks.flat_map { |chunk| chunk.chars.zip(master_key) }
    end
  end

  def set_rotate_parts(combinations)
    combinations.map do |combination|
      character     = combination[0]
      unique_key    = combination[1]
      unique_offset = combination[2]
      rotate(character, unique_key, unique_offset)
    end
  end

  def combine_key_and_offset(key, date)
    combinations = key.zip(date)
    combinations.map!{ |number| number[0].to_i + number[1].to_i }
  end
end
