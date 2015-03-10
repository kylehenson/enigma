require_relative 'decryptor'

input_file_name  = ARGV[0]
output_file_name = ARGV[1]
key              = ARGV[2]
date             = ARGV[3]
Decryptor.new(input_file_name, output_file_name, key, date).decrypt
