# frozen_string_literal: true

require_relative 'key_generator'
require_relative 'text_properties'
require_relative 'constants'
require_relative 'encoder'
require_relative 'decoder'
require_relative 'plain_parser'
require_relative 'result_saver'
require_relative 'args_helper'
require 'json'
require 'debug'
include SubstitutionCipher
include ResultSaver
include ArgsHelper

def start
  plain = File.read(ARGV[0])

  KeyGenerator.call if key_generate?

  Encoder.call(plain: plain) if encode?

  encrypted = File.read(Constants::ENCRYPTED_FILENAME)

  Decoder.call(encrypted: encrypted) if decode?

  puts TextProperties.new(encrypted).extract if text_info?
end

check_args
start
