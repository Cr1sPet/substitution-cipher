# frozen_string_literal: true

module SubstitutionCipher
  class Decoder
    def self.call(...) = new(...).call

    def initialize(key:, encrypted:)
      @key = key
      @encrypted = encrypted
    end

    def call
      @decrypted = decipher
      save_text(Constants::DECRYPTED_FILENAME, decrypted)
    end

    private

    attr_reader :key, :parsed_plain, :encrypted, :decrypted

    def decipher
      encrypted.split('').inject do |memo, el|
        memo.concat(key.key(el))
      end
    end

    def abc
      Constants::RU_ABC
    end
  end
end
