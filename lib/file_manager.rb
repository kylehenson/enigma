module FileManager

  def self.message(input_file_name)
    File.open(input_file_name).read
  end

  def self.output(output_file_name, message)
    File.open(output_file_name, 'w') { |file| file.write(message) }
  end

end
