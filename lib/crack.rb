require_relative 'cracker'

input_file_name  = ARGV[0]
output_file_name = ARGV[1]
date = ARGV[2]
Cracker.new(input_file_name, output_file_name, date).crack
