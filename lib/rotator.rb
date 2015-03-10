require_relative 'character_map'
require_relative 'key'
require_relative 'offset'
class Rotator

  attr_reader :total_rotate, :map, :new_map, :message

  def initialize
    @map = CharacterMap.characters
    @key = Key.new
    @date = Offset.new
  end

  def rotate(character, key, offset)
    total_rotate = key + offset
    for_key(character, total_rotate)
  end

  def for_key(character, total_rotate)
    new_index = (map.index(character) + total_rotate) % map.length

    map[new_index]
  end

  def decrypt_rotate(character, key, offset)
    total_rotate = key + offset
    decrypt_for_key(character, total_rotate)
  end

  def decrypt_for_key(character, total_rotate)
    new_index = (map.index(character) - total_rotate) % map.length

    map[new_index]
  end

  def encrypt_message(message)
    chunks        = message.scan(/.{1,4}/)
    master_key    = @key.rotations
    master_offset = @date.offset
    puts "Created 'encrypted.txt' with the key #{@key.key.join} and date #{@date.date}"
    combinations = create_combinations(chunks, master_key, master_offset)

    scrambled_characters = set_rotate_parts(combinations)

    scrambled_characters.join
  end

  def decrypt_message(message, key, date)
    chunks        = message.scan(/.{1,4}/)
    master_key    = Key.new.decrypt_code(key)
    master_offset = Offset.new.decrypt_offset(date)

    combinations = create_combinations(chunks, master_key, master_offset)

    scrambled_characters = decrypt_set_rotate_parts(combinations)

    scrambled_characters.join
  end

  def create_combinations(chunks, master_key, master_offset)
    chunks.flat_map { |chunk| chunk.chars.zip(master_key, master_offset) }
  end

  def set_rotate_parts(combinations)
    combinations.map do |combination|
      character     = combination[0]
      unique_key    = combination[1]
      unique_offset = combination[2]
      rotate(character, unique_key, unique_offset)
    end
  end

  def decrypt_set_rotate_parts(combinations)
    combinations.map do |combination|
      character     = combination[0]
      unique_key    = combination[1]
      unique_offset = combination[2]
      decrypt_rotate(character, unique_key, unique_offset)
    end
  end

end
