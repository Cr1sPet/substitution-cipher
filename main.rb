# frozen_string_literal: true

require 'json'
require 'debug'
require 'optparse'
require_relative 'file_reader'
require_relative 'key_generator'
require_relative 'text_properties'
require_relative 'constants'
require_relative 'encoder'
require_relative 'decoder'
require_relative 'plain_parser'
require_relative 'result_saver'
require_relative 'parser'
include SubstitutionCipher
include ResultSaver

def start(opts)
  case opts[:mode]
  when 'ENCODE'
    KeyGenerator.call
    Encoder.call(input: opts[:input_file], output: opts[:output_file])
  when 'DECODE'
    Decoder.call(input: opts[:input_file], output: opts[:output_file])
    TextProperties.new(opts[:input_file]).extract
  end
end

ARGV << '-h' if ARGV.empty?

begin
  opts = Parser.parse

  start(opts)
rescue StandardError => e
  puts e.message
end
