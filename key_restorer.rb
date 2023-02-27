# frozen_string_literal: true

module SubstitutionCipher
  class KeyRestorer
    def self.call(...) = new(...).call

    def initialize(encrypted_filename:, decrypted_filename:)
      @encrypted = encrypted_filename
      @decrypted = decrypted_filename
    end

    def call
      puts "================\nkey restoring"
      enc_freq = TextProperties.new(encrypted).char_frequency
      dec_freq = TextProperties.new(decrypted).char_frequency
      key = enc_freq.keys.zip(dec_freq.keys).to_h.sort.to_h
      ResultSaver.save_json(Constants::RESTORED_KEY_FILENAME, key)
    end

    private

    def abc
      Constants::RU_ABC
    end

    attr_reader :update_saved_key, :key, :encrypted, :decrypted

    def generate
      abc.each_char.with_object({}) do |ch, key|
        key[ch] = get_value(ch)
      end
    rescue RuntimeError
      retry
    end

    def get_value(except)
      val = values[rand(values.size)]

      while val == except
        raise RuntimeError if values.length == 1

        val = values[rand(values.size)]
      end

      values.delete!(val)
      val
    end
  end
end
