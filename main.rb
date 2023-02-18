# frozen_string_literal: true

require_relative 'key_generator'
require_relative 'constants'
require_relative 'encoder'
require_relative 'decoder'
require_relative 'plain_parser'
require_relative 'result_saver'
require 'json'
include SubstitutionCipher
include ResultSaver

plain = File.read(ARGV[0])
key = KeyGenerator.call
Encoder.call(plain: plain)
encrypted = File.read(Constants::ENCRYPTED_FILENAME)
Decoder.call(key: key, encrypted: encrypted)
