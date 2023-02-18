# frozen_string_literal: true

require_relative 'key_generator'
require_relative 'constants'
require_relative 'encoder'
require_relative 'decoder'
require_relative 'plain_parser'
require_relative 'result_saver'
require 'debug'
include SubstitutionCipher

# begin
plain = File.read(ARGV[0])
key = KeyGenerator.call
Encoder.call(key: key, plain: plain)
encrypted = File.read(Constants::ENCRYPTED_FILENAME)
Decoder.call(key: key, encrypted: encrypted)
# rescue StandardError => e
#   if e.class == TypeError
#     puts "Укажите путь к файлу в аргументе при запуске"
#   end
#   puts e.class
#   puts e.message
# end
