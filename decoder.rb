# frozen_string_literal: true

module SubstitutionCipher
  class Decoder
    def self.call(...) = new(...).call

    def initialize(encrypted:, key: nil)
      @key = key || read_key
      @encrypted = encrypted
    end

    def call
      puts "================\ndecode"
      @decrypted = decipher
      save_text(Constants::DECRYPTED_FILENAME, decrypted)
    end

    private

    attr_reader :key, :parsed_plain, :encrypted, :decrypted

    def decipher
      encrypted.gsub(/./) { |char| key.key(char) }
    end

    def read_key
      JSON.parse(File.read('key.json'))
    end

    def abc
      Constants::RU_ABC
    end
  end
end
