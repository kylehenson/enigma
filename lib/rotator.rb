require_relative 'character_map'
class Rotator

  attr_reader :total_rotate, :map, :new_map, :message

  def initialize
    @map = CharacterMap.characters
  end

  def rotate(letter, key, offset)
    @total_rotate = key + offset
    for_key(letter, total_rotate)
  end

  def for_key(letter, total_rotate)
    new_index = (map.index(letter) + total_rotate) % map.length

    map[new_index]
  end

  def rotate_message(message)
    chunks        = message.scan(/.{1,4}/)
    master_key    = Key.new.rotations
    master_offset = Offset.new.offset

    combinations = chunks.flat_map do |chunk|
      chunk.chars.zip(master_key, master_offset)
    end

    scrambled_characters = combinations.map do |combination|
      character     = combination[0]
      unique_key    = combination[1]
      unique_offset = combination[2]
      rotate(character, unique_key, unique_offset)
    end

    scrambled_characters.join
  end

end
