# frozen_string_literal: true

module SubstitutionCipher
  class Decoder
    def self.call(...) = new(...).call

    def initialize(input:, output: nil, key: nil)
      @key = key || read_key
      @encrypted = FileReader.read(input)
      @output_filename = output || Constants::DECRYPTED_FILENAME
      puts "================\ndecode"
    end

    def call
      save_text(output_filename, decipher)
    end

    private

    attr_reader :key, :parsed_plain, :encrypted, :decrypted, :output_filename

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
