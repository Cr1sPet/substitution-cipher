# frozen_string_literal: true

require_relative 'key_generator'
include SubstitutionCipher

begin
  p KeyGenerator.call
rescue StandardError => e
  puts e.class
  puts e.message
end
