# frozen_string_literal: true

module SubstitutionCipher
  class Encoder
    def self.call(...) = new(...).call

    def initialize(plain:, key: nil)
      @key = key || read_key
      @parsed_plain = PlainParser.call(plain: plain)
    end

    def call
      puts "================\nencode"
      @encrypted = cipher
      save_text(Constants::ENCRYPTED_FILENAME, encrypted)
    end

    private

    attr_reader :key, :parsed_plain, :encrypted

    def read_key
      JSON.parse(File.read(Constants::KEY_FILENAME))
    end

    def cipher
      parsed_plain.gsub(/./) { |char| key[char] }
    end

    def abc
      Constants::RU_ABC
    end
  end
end
