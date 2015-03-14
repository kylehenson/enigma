require_relative 'test_helper'
require_relative '../lib/file_manager'

class FileManagerTest < Minitest::Test

  def test_it_reads_a_file
    assert self.message("../message.txt")
  end

end
