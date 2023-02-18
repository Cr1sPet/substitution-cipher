# frozen_string_literal: true

module SubstitutionCipher
  class Encoder
    def self.call(...) = new(...).call

    def initialize(key:, plain:)
      @key = key
      @parsed_plain = PlainParser.call(plain: plain)
    end

    def call
      @encrypted = cipher
      ResultSaver.save_file(filename: Constants::ENCRYPTED_FILENAME, data: encrypted)
    end

    private

    attr_reader :key, :parsed_plain, :encrypted

    def cipher
      parsed_plain.split('').inject do |memo, el|
        memo.concat(key[el])
      end
    end

    def abc
      Constants::RU_ABC
    end
  end
end
