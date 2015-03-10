require_relative 'encryptor'

input_file_name  = ARGV[0]
output_file_name = ARGV[1]
Encryptor.new(input_file_name, output_file_name).encrypt
