class CharacterMap

  def characters
    ('a'..'z').to_a + ('0'..'9').to_a + [" ", ".", ","]
  end

end
