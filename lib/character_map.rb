module CharacterMap

  def self.characters
    ('a'..'z').to_a + ('0'..'9').to_a + [" ", ".", ","]
  end

end
