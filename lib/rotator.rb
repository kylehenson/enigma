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
    new_index = (map.index(letter) + total_rotate) % 39

    map[new_index]
  end

  def parse(chunk)
    @message = chunk.chars
  end

  def rotate_message(message, key, offset)
    split_rotation = message.map do |character|
      rotate(character, key, offset)
    end
    split_rotation.join
  end

end
