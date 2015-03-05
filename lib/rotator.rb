require_relative 'character_map'
class Rotator
  attr_reader :total_rotate, :map, :new_map

  def initialize
    @map = CharacterMap.new
    @new_map = {'a' => 1,'b' => 2,'c' => 3,'d' => 4,'e' => 5,'f' => 6,'g' => 7,'h' => 8,'i' => 9,'j' => 10,'k' => 11,'l' => 12,'m' => 13,'n' => 14,'o' => 15, 'p' => 16, 'q' => 17, 'r' => 18, 's' => 19, 't' => 20,'u' => 21, 'v' => 22,'w' => 23,'x' => 24,'y' => 25,'z' => 26,'0' => 27,'1' => 28,'2' => 29,'3' => 30,'4' => 31,'5' => 32,'6' => 33,'7' => 34,'8' => 35,'9' => 36,' ' => 37,'.' => 38,',' => 39}
  end

  def rotate(letter, key, offset)
    @total_rotate = key + offset
    for_key(letter, total_rotate)
  end

  def for_key(letter, total_rotate)
    new_key = map.characters.index(letter) + 1 + total_rotate % 39
    new_map.key(new_key)
  end

  def parse(chunk)
    chunk.chars
  end

end
