# frozen_string_literal: true

module SubstitutionCipher
  class Encoder
    def self.call(...) = new(...).call

    def initialize(plain:, key: nil)
      @key = key || read_key
      @parsed_plain = PlainParser.call(plain: plain)
    end

    def call
      @encrypted = cipher
      save_text(Constants::ENCRYPTED_FILENAME, encrypted)
    end

    private

    attr_reader :key, :parsed_plain, :encrypted

    def read_key
      JSON.parse(File.read(Constants::KEY_FILENAME))
    end

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
