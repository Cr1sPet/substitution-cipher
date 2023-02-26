# frozen_string_literal: true

module SubstitutionCipher
  class Encoder
    def self.call(...) = new(...).call

    def initialize(input:, output: nil, key: nil)
      @key = key || read_key
      @parsed_plain = PlainParser.call(plain: FileReader.read(input))
      @output_filename = output || Constants::ENCRYPTED_FILENAME
    end

    def call
      puts "================\nencode"
      @encrypted = cipher
      save_text(output_filename, encrypted)
    end

    private

    attr_reader :key, :parsed_plain, :encrypted, :output_filename

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
